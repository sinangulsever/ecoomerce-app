<?php

namespace App\Exceptions;

use App\Traits\ApiResponseTrait;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Exception\RouteNotFoundException;
use Throwable;

class ApiExceptionHandler
{
    use ApiResponseTrait;

    /**
     * Map of exception classes to their handler methods
     */
    public static array $handlers = [
        AuthenticationException::class => 'handleAuthenticationException',
        AccessDeniedHttpException::class => 'handleAuthenticationException',
        AuthorizationException::class => 'handleAuthorizationException',
        ValidationException::class => 'handleValidationException',
        ModelNotFoundException::class => 'handleNotFoundException',
        NotFoundHttpException::class => 'handleNotFoundException',
        MethodNotAllowedHttpException::class => 'handleMethodNotAllowedException',
        HttpException::class => 'handleHttpException',
        QueryException::class => 'handleQueryException',
        RouteNotFoundException::class => 'handleRouteNotFoundException',
    ];

    /**
     * Handle authentication exceptions
     */
    public function handleAuthenticationException(AuthenticationException|AccessDeniedHttpException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Authentication failed');

        return $this->errorResponse(
            message: 'Kimlik doğrulaması gerekli. Lütfen geçerli kimlik bilgilerini sağlayın.',
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => 401,
                'timestamp' => now()->toISOString(),
            ],
            httpCode: 401
        );
    }

    /**
     * Handle route not found exceptions
     */
    public function handleRouteNotFoundException(RouteNotFoundException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Route not found');

        return $this->errorResponse(
            message: 'The requested route was not found.',
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => 404,
                'timestamp' => now()->toISOString(),
            ],
            httpCode: 404
        );
    }

    /**
     * Handle authorization exceptions
     */
    public function handleAuthorizationException(AuthorizationException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Authorization failed');

        return $this->errorResponse(
            message: 'Bu eylemi gerçekleştirme yetkiniz yok.',
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => 403,
                'timestamp' => now()->toISOString(),
            ],
            httpCode: 403
        );
    }

    /**
     * Handle validation exceptions
     */
    public function handleValidationException(ValidationException $e, Request $request): JsonResponse
    {
        $errors = [];

        foreach ($e->errors() as $field => $messages) {
            foreach ($messages as $message) {
                $errors[] = [
                    'field' => $field,
                    'message' => $message,
                ];
            }
        }

        $this->logException($e, 'Validation failed', ['errors' => $errors]);

        return $this->errorResponse(
            message: 'Verilen veriler geçersiz.',
            errors: $errors,
            httpCode: 422
        );
    }

    /**
     * Handle not found exceptions
     */
    public function handleNotFoundException(ModelNotFoundException|NotFoundHttpException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Resource not found');

        $message = $e instanceof ModelNotFoundException ? 'The requested resource was not found.' : "The requested endpoint '{$request->getRequestUri()}' was not found.";

        return $this->errorResponse(
            message: $message,
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => 404,
                'message' => $message,
                'timestamp' => now()->toISOString(),
            ],
            httpCode: 404
        );
    }

    /**
     * Handle method not allowed exceptions
     */
    public function handleMethodNotAllowedException(MethodNotAllowedHttpException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Method not allowed');

        return $this->errorResponse(
            message: "The {$request->method()} method is not allowed for this endpoint.",
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => 405,
                'message' => "The {$request->method()} method is not allowed for this endpoint.",
                'timestamp' => now()->toISOString(),
                'allowed_methods' => $e->getHeaders()['Allow'] ?? 'Unknown',
            ],
            httpCode: 405
        );
    }

    /**
     * Handle general HTTP exceptions
     */
    public function handleHttpException(HttpException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'HTTP exception occurred');

        return $this->errorResponse(
            message: $e->getMessage() ?: 'An HTTP error occurred.',
            errors: [
                'type' => $this->getExceptionType($e),
                'status' => $e->getStatusCode(),
                'message' => $e->getMessage() ?: 'An HTTP error occurred.',
                'timestamp' => now()->toISOString(),
            ],
            httpCode: $e->getStatusCode()
        );
    }

    /**
     * Handle database query exceptions
     */
    public function handleQueryException(QueryException $e, Request $request): JsonResponse
    {
        $this->logException($e, 'Database query failed', ['sql' => $e->getSql()]);

        $errorCode = $e->errorInfo[1] ?? null;

        return match ($errorCode) {
            1451 => $this->errorResponse(
                message: 'Cannot delete or update this resource because it is referenced by other records.',
                errors: [
                    'type' => $this->getExceptionType($e),
                    'status' => 409,
                    'timestamp' => now()->toISOString(),
                ],
                httpCode: 409
            ),
            1062 => $this->errorResponse(
                message: 'A record with this information already exists.',
                errors: [
                    'type' => $this->getExceptionType($e),
                    'status' => 409,
                    'timestamp' => now()->toISOString(),
                ],
                httpCode: 409
            ),
            default => $this->errorResponse(
                message: 'A database error occurred. Please try again later.',
                errors: [
                    'type' => $this->getExceptionType($e),
                    'status' => 500,
                    'timestamp' => now()->toISOString(),
                ],
                httpCode: 500
            ),
        };
    }

    /**
     * Extract a clean exception type name
     */
    private function getExceptionType(Throwable $e): string
    {
        return basename(str_replace('\\', '/', get_class($e)));
    }

    /**
     * Log exception with context
     */
    private function logException(Throwable $e, string $message, array $context = []): void
    {
        $logContext = array_merge([
            'exception' => get_class($e),
            'message' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine(),
            'url' => request()->fullUrl(),
            'method' => request()->method(),
            'ip' => request()->ip(),
        ], $context);

        Log::warning($message, $logContext);
    }
}
