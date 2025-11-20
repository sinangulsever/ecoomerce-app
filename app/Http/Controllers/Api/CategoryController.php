<?php

namespace App\Http\Controllers\Api;

use App\Http\Requests\Api\Category\StoreCategoryRequest;
use App\Http\Requests\Api\Category\UpdateCategoryRequest;
use App\Http\Resources\CategoryResource;
use App\Models\Category;
use App\Services\CategoryService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class CategoryController extends BaseApiController
{

    protected CategoryService $categoryService;

    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    /**
     * List Categories
     * @return JsonResponse
     */
    public function index(): JsonResponse
    {
        return $this->paginateResponse(
            paginator: $this->categoryService->getAllCategoriesByUser(),
            resourceClass: CategoryResource::class
        );
    }

    /**
     *  New category creation
     * @param StoreCategoryRequest $request
     * @return JsonResponse
     */
    public function store(StoreCategoryRequest $request): JsonResponse
    {
        $this->authorize('create', Category::class);
        $category = $this->categoryService->createCategory($request->validated());
        return $this->successResponse(
            data: new CategoryResource($category),
            message: 'Category created successfully',
            httpCode: 201
        );
    }

    /**
     * Show the Category resource.
     * @param Category $category
     * @return JsonResponse
     */
    public function show(Category $category): JsonResponse
    {
        return $this->successResponse(
            data: new CategoryResource($category),
            message: 'Category retrieved successfully'
        );
    }

    /**
     * Update category
     * @param UpdateCategoryRequest $request
     * @param Category $category
     * @return JsonResponse
     */
    public function update(UpdateCategoryRequest $request, Category $category): JsonResponse
    {
        $this->authorize('update', $category);
        $updatedCategory = $this->categoryService->updateCategory($category, $request->validated());
        return $this->successResponse(
            data: new CategoryResource($updatedCategory),
            message: 'Category updated successfully'
        );
    }

    /**
     * Delete category
     * @param Category $category
     * @return Response|JsonResponse
     */
    public function destroy(Category $category)
    {
        $this->authorize('delete', $category);
        if ($this->categoryService->deleteCategory($category->id)) {
            return $this->noContentResponse();
        }
        return $this->serverErrorResponse(message: 'Category could not be deleted.');

    }

}
