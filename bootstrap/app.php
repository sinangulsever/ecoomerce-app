<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use App\Exceptions\ApiExceptionHandler;
use Illuminate\Auth\AuthenticationException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        //
    })
    ->withExceptions(function (Exceptions $exceptions) {

        $exceptions->render(function (AuthenticationException $e, Request $request) {
            if ($request->is('api/*') || $request->expectsJson()) {
                return rj(
                    status: false,
                    message: 'Kimlik doğrulaması gerekli. Token geçersiz veya eksik.',
                    errors: [
                        'type' => 'AuthenticationException',
                        'timestamp' => now()->toISOString(),
                    ],
                    httpCode: 401
                );
            }
            return $e;
        });

        $exceptions->render(function (\Symfony\Component\HttpKernel\Exception\NotFoundHttpException $e, Request $request) {

            if ($request->is('api/*') || $request->expectsJson()) {
                return rj(
                    status: false,
                    message: 'Aranan kaynak bulunamadı.',
                    errors: [
                        'message' => $e->getMessage(),
                        'type' => 'NotFoundHttpException',
                        'status' => 404,
                        'timestamp' => now()->toISOString(),
                    ],
                    httpCode: 404
                );
            }
            return $e;
        });

        $exceptions->render(function (\Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException $e, Request $request) {

            if ($request->is('api/*') || $request->expectsJson()) {
                return rj(
                    status: false,
                    message: 'Bu işlemi gerçekleştirmek için yetkiniz yok.',
                    errors: [
                        'type' => 'AccessDeniedHttpException',
                        'status' => 403,
                        'timestamp' => now()->toISOString(),
                    ],
                    httpCode: 403
                );
            }
            return $e;
        });


        $exceptions->shouldRenderJsonWhen(function (Request $request, Throwable $e) {
            if (($request->is('api/*') || $request->expectsJson())) {

                $className = get_class($e);
                $handlers = ApiExceptionHandler::$handlers;

                if (array_key_exists($className, $handlers)) {
                    $method = $handlers[$className];

                    $apiHandler = new ApiExceptionHandler();
                    return $apiHandler->$method($e, $request);
                }

                return rj(
                    status: false,
                    message: 'An unexpected error occurred',
                    errors: [
                        'type' => basename(get_class($e)),
                        'status' => $e->getCode() ?: 500,
                        'message' => $e->getMessage() ?: 'An unexpected error occurred',
                        'timestamp' => now()->toISOString(),
                    ],
                    httpCode: $e->getCode() ?: 500,
                );
            }
            return $e;
        });
    })->create();
