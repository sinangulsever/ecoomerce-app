<?php

namespace App\Repositories\Eloquent;

use App\Models\Order;
use App\Models\OrderItem;
use App\Repositories\Interfaces\OrderRepositoryInterface;
use Illuminate\Database\Eloquent\Model;
use Spatie\QueryBuilder\QueryBuilder;

class OrderRepository extends BaseRepository implements OrderRepositoryInterface
{

    public function __construct(Order $model)
    {
        $this->model = $model;
    }

    /**
     * Get all orders.
     *
     * @return QueryBuilder
     */
    public function getQueryBuilderOrder(): QueryBuilder
    {
        return QueryBuilder::for(subject: $this->model::class);
    }

    /**
     * Create an order item associated with the order.
     *
     * @param Order $order
     * @param array $data
     * @return Model
     */
    public function createOrderItem(Order $order, array $data): Model
    {
        return $order->order_items()->create($data);
    }

    /**
     * Update an order item.
     *
     * @param OrderItem $orderItem
     * @param array $data
     * @return bool
     */
    public function updateOrderItem(OrderItem $orderItem, array $data): bool
    {
        return $orderItem->update($data);
    }


}
