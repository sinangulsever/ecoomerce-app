<?php

namespace App\Http\Controllers\Api;

use App\Http\Resources\OrderResource;
use App\Models\Order;
use App\Services\CartService;
use App\Services\OrderService;
use Exception;
use Illuminate\Http\JsonResponse;
use Throwable;

class OrderController extends BaseApiController
{

    protected OrderService $orderService;
    protected CartService $cartService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;

    }

    /**
     * User orders list
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->paginateResponse(
            paginator: $this->orderService->getUserOrderList(),
            resourceClass: OrderResource::class,
        );
    }

    /**
     * @throws Exception|Throwable
     */
    public function store(): JsonResponse
    {
        try {
            $this->orderService->createOrders();
            return $this->successResponse(
                message: 'Order created successfully'
            );
        } catch (Exception $e) {
            return $this->errorResponse(
                message: $e->getMessage(),
            );
        }
    }

    /**
     * Show the Order resource.
     * @param Order $order
     * @return JsonResponse
     */
    public function show(Order $order): JsonResponse
    {
        $this->authorize('view', $order);
        return $this->successResponse(
            data: new OrderResource($order),
            message: 'Order retrieved successfully'
        );
    }

}
