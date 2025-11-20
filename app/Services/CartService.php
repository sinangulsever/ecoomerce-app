<?php

namespace App\Services;

use App\Models\Cart;
use App\Models\Product;
use App\Repositories\Interfaces\CartRepositoryInterface;

class CartService
{
    public function __construct(protected CartRepositoryInterface $cartRepository)
    {
    }


    public function getCartByUser(int $userId): ?Cart
    {
        $cart = $this->cartRepository->query()->where('user_id', $userId)->first();

        if (!$cart) {
            $cart = $this->cartRepository->create([
                'user_id' => $userId,
            ]);
        }
        return $cart->load('products');
    }

    /**
     * Add product to cart
     *
     * @param Cart $cart
     * @param int $product_id
     * @param int $quantity
     * @return Cart
     */
    public function addProductToCart(Cart $cart, int $product_id, int $quantity): Cart
    {
        return $this->cartRepository->attachProduct($cart, $product_id, $quantity);
    }

    /**
     * Remove product from cart
     *
     * @param Cart $cart
     * @param int $product_id
     * @return int
     */
    public function removeProductFromCart(Cart $cart, int $product_id): int
    {
        return $this->cartRepository->detachProduct($cart, $product_id);

    }

    /**
     * Update products in cart
     *
     * @param Cart $cart
     * @param array $products
     * @return array|array[]
     */
    public function updateProductsInCart(Cart $cart, array $products): array
    {
        return $this->cartRepository->syncProducts($cart, $products);
    }


    /**
     * Clear all products from cart
     *
     * @param Cart $cart
     * @return Cart
     */
    public function clearCart(Cart $cart): Cart
    {
        return $this->cartRepository->clearCart($cart);
    }
}
