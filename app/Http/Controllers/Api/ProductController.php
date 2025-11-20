<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\Product\StoreProductRequest;
use App\Http\Requests\Api\Product\UpdateProductRequest;
use App\Http\Resources\ProductResource;
use App\Models\Product;
use App\Services\ProductService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class ProductController extends BaseApiController
{
    protected ProductService $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    /**
     * List products
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->paginateResponse(paginator: $this->productService->getAllProducts(), resourceClass: ProductResource::class);
    }

    /**
     * Show the Product resource.
     * @param Product|null $product
     * @return JsonResponse
     */
    public function show(?Product $product): JsonResponse
    {
        if (empty($product)) {
            return $this->errorResponse(message: 'Product not found', httpCode: 404);
        }
        return $this->successResponse(data: new ProductResource($product), message: 'Product retrieved successfully');
    }

    /**
     *  New product creation
     * @param StoreProductRequest $request
     * @return JsonResponse
     */
    public function store(StoreProductRequest $request)
    {
        $this->authorize('create', Product::class);
        $product = $this->productService->createProduct($request->validated());
        return $this->successResponse(data: new ProductResource($product), message: 'Product created successfully', httpCode: 201);
    }

    /**
     * Update product
     * @param UpdateProductRequest $request
     * @param Product $product
     * @return JsonResponse
     */
    public function update(UpdateProductRequest $request, Product $product): JsonResponse
    {
        $this->authorize('update', $product);
        $product = $this->productService->updateProduct($product, $request->validated());
        return $this->successResponse(data: new ProductResource($product), message: 'Product updated successfully');
    }

    /**
     * Delete product
     * @param Product $product
     * @return Response|JsonResponse
     */
    public function destroy(Product $product): Response|JsonResponse
    {
        $this->authorize('delete', $product);
        if ($this->productService->deleteProduct($product->id)) {
            return $this->noContentResponse();
        }
        return $this->errorResponse(message: 'Product could not be deleted', httpCode: 500);

    }


}
