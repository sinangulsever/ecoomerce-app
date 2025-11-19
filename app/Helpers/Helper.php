<?php

use Illuminate\Http\JsonResponse;

if (!function_exists("rj")) {
    function rj(bool $status, ?string $message, ?array $errors = [], mixed $data = null, array $meta = [], int $httpCode = 200): JsonResponse
    {
        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => !empty($data) ? $data : null,
            'meta' => !empty($meta) ? $meta : null,
            'errors' => !empty($errors) ? $errors : null,

        ], $httpCode);

    }
}
if (!function_exists('getUser')) {
    function getUser(): \Illuminate\Contracts\Auth\Authenticatable|\App\Models\User|null
    {
        if (auth('api')->check()) {
            return auth('api')->user();
        }
        return null;
    }
}
