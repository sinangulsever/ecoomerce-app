<?php

namespace App\Repositories\Interfaces;

use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Database\Eloquent\Model;
use Spatie\QueryBuilder\QueryBuilder;

interface OrderRepositoryInterface extends BaseRepositoryInterface
{

    /**
     * Get all orders.
     *
     * @return QueryBuilder
     */
    public function getQueryBuilderOrder(): QueryBuilder;

    /**
     * Create an order item associated with the order.
     *
     * @param Order $order
     * @param array $data
     * @return Model
     */
    public function createOrderItem(Order $order, array $data): Model;

    /**
     * Update an order item.
     *
     * @param OrderItem $orderItem
     * @param array $data
     * @return bool
     */
    public function updateOrderItem(OrderItem $orderItem, array $data): bool;

}
