<?php

namespace App\Repositories\Eloquent;

use App\Models\Product;
use App\Repositories\Interfaces\ProductRepositoryInterface;
use Spatie\QueryBuilder\QueryBuilder;

class ProductRepository extends BaseRepository implements ProductRepositoryInterface
{
    public function __construct(Product $model)
    {
        $this->model = $model;
    }

    /**
     * Get all products.
     *
     * @return QueryBuilder
     */

    public function getQueryBuilderProduct(): QueryBuilder
    {
        return QueryBuilder::for(subject: $this->model::class);
    }

}
