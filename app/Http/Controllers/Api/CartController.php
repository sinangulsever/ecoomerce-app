<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Cart\AddCartRequest;
use App\Http\Requests\Api\Cart\RemoveCartRequest;
use App\Http\Resources\CartResource;
use App\Models\Product;
use App\Services\CartService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends BaseApiController
{
    protected CartService $cartService;


    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    /**
     * List Cart Items
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->successResponse(data: new CartResource($this->cartService->getCartByUser(getUser()->id)), message: 'Cart retrieved successfully');
    }


    /**
     * Add product to cart
     * @param AddCartRequest $request
     * @return JsonResponse
     */
    public function addToCart(AddCartRequest $request): JsonResponse
    {
        $cart = $this->cartService->getCartByUser(getUser()->id);
        $updatedCart = $this->cartService->addProductToCart($cart, $request->product_id, $request->quantity);
        return $this->successResponse(data: new CartResource($updatedCart), message: 'Product added to cart successfully');
    }


    /**
     * Remove product from cart
     * @param Product|null $product
     * @return JsonResponse
     */
    public function removeFromCart(?Product $product): JsonResponse
    {
        if (!$product) {
            return $this->errorResponse(message: 'Product not found', httpCode: 404);
        }
        $cart = $this->cartService->getCartByUser(getUser()->id);
        $this->cartService->removeProductFromCart($cart, $product->id);
        return $this->successResponse(data: new CartResource($cart->refresh()), message: 'Product removed from cart successfully');

    }

    /**
     * Clear all products from cart
     * @return JsonResponse
     */
    public function clearFromCart(): JsonResponse
    {
        $cart = $this->cartService->getCartByUser(getUser()->id);
        $this->cartService->clearCart($cart);
        return $this->successResponse(data: new CartResource($cart->refresh()), message: 'Cart cleared successfully');

    }


}
