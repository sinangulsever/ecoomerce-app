<?php

namespace App\Repositories\Eloquent;

use App\Models\Cart;
use App\Models\Product;
use App\Repositories\Interfaces\CartRepositoryInterface;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class CartRepository extends BaseRepository implements CartRepositoryInterface
{
    protected Model $model;

    public function __construct(Cart $model)
    {
        $this->model = $model;
    }

    /**
     * Attach product to the cart
     *
     * @param Cart $cart
     * @param int $productId
     * @param $quantity
     * @return Cart
     */
    public function attachProduct(Cart $cart, int $productId, $quantity): Cart
    {
        if ($cart->products()->where('product_id', $productId)->exists()) {
            $cart->products()->updateExistingPivot($productId, ['quantity' => $quantity]);
        } else {
            $cart->products()->attach($productId, ['quantity' => $productId]);
        }
        return $cart->refresh();
    }

    /**
     * Detach product from the cart
     *
     * @param Cart $cart
     * @param int $productId
     * @return int
     */
    public function detachProduct(Cart $cart, int $productId): int
    {
        return $cart->products()->detach($productId);
    }

    /**
     * Sync products in the cart
     *
     * @param Cart $cart
     * @param array $products
     * @return array|array[]
     */
    public function syncProducts(Cart $cart, array $products): array
    {
        $syncData = array_map(function ($quantity) {
            return ['quantity' => $quantity];
        }, $products);

        return $cart->products()->sync($syncData);

    }

    /**
     * Clear all products from the cart
     *
     * @param Cart $cart
     * @return Cart
     */
    public function clearCart(Cart $cart): Cart
    {
        $cart->products()->detach();
        return $cart->refresh();
    }

    public function query(): Builder
    {
        return $this->model->newQuery();
    }
}
