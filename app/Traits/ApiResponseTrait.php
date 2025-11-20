<?php

namespace App\Traits;

use Illuminate\Http\JsonResponse;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Http\Response;

trait ApiResponseTrait
{

    /**
     * @param mixed $data
     * @param string|null $message
     * @param int $httpCode
     * @param array $meta
     * @return JsonResponse
     */
    protected function successResponse(mixed $data = null, ?string $message = 'İşlem başarılı.', int $httpCode = 200, array $meta = []): JsonResponse
    {
        return response()->json([
            'status' => true,
            'message' => $message,
            'data' => $data,
            'meta' => !empty($meta) ? $meta : null,
            'errors' => null,
        ], $httpCode);
    }

    /**
     * @param string $message
     * @param array|null $errors
     * @param int $httpCode
     * @return JsonResponse
     */
    public function errorResponse(string $message = 'Bir hata oluştu.', ?array $errors = null, int $httpCode = 400): JsonResponse
    {
        return response()->json([
            'status' => false,
            'message' => $message,
            'data' => null,
            'meta' => null,
            'errors' => $errors,
        ], $httpCode);
    }

    /**
     * @param array $errors
     * @param string $message
     * @param int $httpCode
     * @return JsonResponse
     */
    public function validationErrorResponse(array $errors, string $message = 'Geçersiz veri.', int $httpCode = 422): JsonResponse
    {
        return $this->errorResponse($message, $errors, $httpCode);
    }

    /**
     * @param string|null $message
     * @param string|null $detail
     * @return JsonResponse
     */
    public function serverErrorResponse(?string $message = 'Sunucu hatası oluştu.', ?string $detail = null): JsonResponse
    {
        return $this->errorResponse($message, $detail ? ['detail' => $detail] : null, 500);
    }

    /**
     * @param string $message
     * @return JsonResponse
     */
    public function unauthorizedResponse(string $message = 'Yetkisiz erişim.'): JsonResponse
    {
        return $this->errorResponse($message, null, 401);
    }

    /**
     * @param string $message
     * @return JsonResponse
     */
    public function notFoundResponse(string $message = 'Kaynak bulunamadı.'): JsonResponse
    {
        return $this->errorResponse($message, null, 404);
    }

    /**
     * @return Response
     */
    protected function noContentResponse(): Response
    {
        return response()->noContent();
    }

    /**
     * @param LengthAwarePaginator $paginator
     * @param $resourceClass
     * @param string|null $message
     * @return JsonResponse
     */
    protected function paginateResponse(LengthAwarePaginator $paginator, $resourceClass = null, string $message = null): JsonResponse
    {
        $paginator->appends(request()->query());

        $data = $resourceClass ? $resourceClass::collection($paginator) : $paginator->items();

        return $this->successResponse(
            data: $data,
            message: $message,
            meta: [
                'pagination' => [
                    'total' => $paginator->total(),
                    'per_page' => $paginator->perPage(),
                    'current_page' => $paginator->currentPage(),
                    'last_page' => $paginator->lastPage(),
                    'from' => $paginator->firstItem(),
                    'to' => $paginator->lastItem(),
                    'links' => $paginator->linkCollection(),
                ]
            ]
        );
    }


}
