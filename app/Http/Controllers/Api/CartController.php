<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\Cart\AddCartRequest;
use App\Http\Resources\CartResource;
use App\Models\Product;
use App\Services\CartService;
use Illuminate\Http\JsonResponse;

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
        return $this->successResponse(
            data: new CartResource($this->cartService->getCartByUser(getUser()->id)),
            message: 'Cart retrieved successfully'
        );
    }


    /**
     * Add product to cart
     * @param AddCartRequest $request
     * @return JsonResponse
     */
    public function addToCart(AddCartRequest $request): JsonResponse
    {
        $updatedCart = $this->cartService->addProductToCart(getUser()->cart, $request->product_id, $request->quantity);
        return $this->successResponse(
            data: new CartResource($updatedCart),
            message: 'Product added to cart successfully'
        );
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
        $this->cartService->removeProductFromCart(getUser()->cart, $product->id);
        return $this->successResponse(
            data: new CartResource(getUser()->cart),
            message: 'Product removed from cart successfully'
        );

    }

    /**
     * Clear all products from cart
     * @return JsonResponse
     */
    public function clearFromCart(): JsonResponse
    {
        $this->cartService->clearCart(getUser()->cart);
        return $this->successResponse(
            data: new CartResource(getUser()->cart),
            message: 'Cart cleared successfully'
        );

    }


}
