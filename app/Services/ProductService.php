<?php

namespace App\Services;

use App\Models\Product;
use App\Repositories\Interfaces\ProductRepositoryInterface;
use Illuminate\Pagination\LengthAwarePaginator;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\AllowedSort;
use Spatie\QueryBuilder\Enums\FilterOperator;
use Spatie\QueryBuilder\Filters\Filter;

class ProductService
{

    public function __construct(protected ProductRepositoryInterface $productRepository)
    {
    }

    /**
     * Get all products.
     *
     * @return LengthAwarePaginator
     */
    public function getAllProducts(): LengthAwarePaginator
    {
        return $this->productRepository->getQueryBuilderProduct()
            ->allowedFilters([
                AllowedFilter::partial('search', 'name'),
                AllowedFilter::exact('category_id', 'category_id'),
                AllowedFilter::operator(
                    'min_price',
                    FilterOperator::GREATER_THAN_OR_EQUAL,
                    'and',
                    'price' // DB column
                ),

                AllowedFilter::operator(
                    'max_price',
                    FilterOperator::LESS_THAN_OR_EQUAL,
                    'and',
                    'price'
                ),
//                AllowedFilter::operator('min_price', FilterOperator::GREATER_THAN_OR_EQUAL,false,'price'),
//                AllowedFilter::operator('max_price', FilterOperator::LESS_THAN_OR_EQUAL,true,'price'),

            ])
            ->allowedSorts([
                AllowedSort::field('name'),
                AllowedSort::field('price'),
                AllowedSort::field('date', 'created_at'),
            ])
            ->defaultSort('created_at')
            ->paginate(request()->query('limit', 20))
            ->appends(request()->query());

    }

    /**
     * Create a new product.
     *
     * @param array $data
     * @return Product
     */
    public function createProduct(array $data): Product
    {
        return $this->productRepository->create($data);
    }

    /**
     * Update a product.
     *
     * @param Product $product
     * @param array $data
     * @return Product
     */
    public function updateProduct(Product $product, array $data): Product
    {
        return $this->productRepository->update($product->id, $data);
    }

    /**
     * Delete a product.
     *
     * @param int $productId
     * @return bool
     */
    public function deleteProduct(int $productId): bool
    {
        return $this->productRepository->delete($productId);
    }

}
