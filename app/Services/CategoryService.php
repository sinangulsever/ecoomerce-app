<?php

namespace App\Services;

use App\Models\Category;
use App\Repositories\Interfaces\CategoryRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;

class CategoryService
{
    public function __construct(protected CategoryRepositoryInterface $categoryRepository)
    {
    }


    /**
     * Get all categories.
     *
     * @return LengthAwarePaginator
     */
    public function getAllCategoriesByUser(): LengthAwarePaginator
    {
        return $this->categoryRepository->getQueryBuilderCategory()
            ->allowedFilters(['name'])
            ->allowedSorts(['name'])
            ->defaultSort('name')
            ->paginate();
    }

    /**
     * Create a new category.
     *
     * @param array $data
     * @return Category
     */

    public function createCategory(array $data): Category
    {
        return $this->categoryRepository->create($data);
    }


    /**
     * Update a category.
     *
     * @param Category $category
     * @param array $data
     * @return Category
     */
    public function updateCategory(Category $category, array $data): Category
    {
        return $this->categoryRepository->update($category->id, $data);
    }

    /**
     * Delete a category.
     *
     * @param int $categoryId
     * @return bool
     */
    public function deleteCategory(int $categoryId): bool
    {
        return $this->categoryRepository->delete($categoryId);
    }

}
