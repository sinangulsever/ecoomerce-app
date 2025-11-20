<?php

namespace App\Services;

use App\Enums\OrderStatus;
use App\Repositories\Interfaces\OrderRepositoryInterface;
use Exception;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\DB;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\AllowedSort;
use Throwable;

class OrderService
{

    public function __construct(
        protected OrderRepositoryInterface $orderRepository,
        protected CartService              $cartService,
    )
    {
    }


    /**
     * Get all orders.
     * @param int|null $userId
     * @return LengthAwarePaginator
     */
    public function getUserOrderList(int $userId = null): LengthAwarePaginator
    {
        $userId = $userId ?? getUser()->id;
        return $this->orderRepository->getQueryBuilderOrder()
            ->where('user_id', $userId)
            ->allowedFilters([
                AllowedFilter::exact('user_id'),
                AllowedFilter::exact('status'),
            ])
            ->allowedSorts([
                AllowedSort::field('created_at'),
            ])
            ->defaultSort('-created_at')
            ->paginate(request()->query('limit', 20))
            ->appends(request()->query());

    }

    /**
     * Create orders from cart.
     * @throws Throwable
     * @throws Exception
     */
    public function createOrders()
    {

        return DB::transaction(function () {
            $cart = $this->cartService->getCartByUser(getUser()->id);

            if ($cart->products->isEmpty()) {
                throw new Exception('Sepetinizde ürün bulunmamaktadır.');
            }

            $total = $cart->products->sum(fn($product) => $product->price * $product->pivot->quantity);

            $order = $this->orderRepository->create([
                'user_id' => getUser()->id,
                'status' => OrderStatus::PENDING,
                'total_amount' => $total,
            ]);

            foreach ($cart->products as $product) {
                $this->orderRepository->createOrderItem($order, [
                    'product_id' => $product->id,
                    'quantity' => $product->pivot->quantity,
                    'price' => $product->price,
                ]);
            }
            $this->cartService->clearCart($cart);
            return $order->load('order_items');

        });

    }


}
