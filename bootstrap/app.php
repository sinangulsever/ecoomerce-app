<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;

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

        $exceptions->render(function (Throwable $e, Request $request) {
            if (!($request->is('api/*') || $request->expectsJson())) {
                return $e;
            }

            $status = match (true) {
                $e instanceof \Illuminate\Auth\AuthenticationException => 401,
                $e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException, $e instanceof \Illuminate\Database\Eloquent\ModelNotFoundException => 404,
                $e instanceof \Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException, $e instanceof \Illuminate\Auth\Access\AuthorizationException => 403,
                $e instanceof \Spatie\QueryBuilder\Exceptions\InvalidFilterQuery, $e instanceof \Spatie\QueryBuilder\Exceptions\InvalidSortQuery => 400,
                $e instanceof \Illuminate\Database\QueryException, $e instanceof \ErrorException, $e instanceof \BadMethodCallException => 500,
                $e instanceof \Illuminate\Validation\ValidationException => 422,
                $e instanceof \Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException => 405,
                $e instanceof \Symfony\Component\HttpKernel\Exception\TooManyRequestsHttpException => 429,
                default => $e->getCode() ?: 500
            };

            $message = match (true) {
                $e instanceof \Illuminate\Auth\AuthenticationException => 'Kimlik doğrulaması gerekli. Token geçersiz veya eksik.',
                $e instanceof \Symfony\Component\HttpKernel\Exception\NotFoundHttpException => 'Aranan kaynak bulunamadı.',
                $e instanceof \Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException => 'Bu işlemi gerçekleştirmek için yetkiniz yok.',
                $e instanceof \Spatie\QueryBuilder\Exceptions\InvalidFilterQuery => 'Geçersiz filtre sorgusu.',
                $e instanceof \Spatie\QueryBuilder\Exceptions\InvalidSortQuery => 'Geçersiz sıralama sorgusu.',
                $e instanceof \Illuminate\Database\QueryException => 'Veritabanı hatası oluştu.',
                $e instanceof \Illuminate\Database\Eloquent\ModelNotFoundException => 'İstenen kaynak bulunamadı.',
                $e instanceof \Illuminate\Validation\ValidationException => 'Doğrulama hatası oluştu.',
                $e instanceof \Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException => 'İzin verilmeyen HTTP metodu kullanıldı.',
                $e instanceof \Symfony\Component\HttpKernel\Exception\TooManyRequestsHttpException => 'Çok fazla istek yapıldı. Lütfen daha sonra tekrar deneyin.',
                default => 'Beklenmeyen bir hata oluştu.'
            };


            $errors = match (true) {
                $e instanceof \Illuminate\Validation\ValidationException => $e->errors(),
                default => null,
            };

            if (!is_null($errors)) {
                return rj(
                    status: false,
                    message: $message,
                    errors: $errors,
                    httpCode: $status
                );
            }


            return rj(
                status: false,
                message: $message,
                errors: [
                    'type' => class_basename($e),
                    'message' => $e->getMessage(),
                    'status' => $status,
                    'timestamp' => now()->toISOString(),
                ],
                httpCode: $status
            );
        });

    })->create();
