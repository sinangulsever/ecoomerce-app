<?php

namespace App\Repositories\Eloquent;

use App\Models\Category;
use App\Repositories\Interfaces\CategoryRepositoryInterface;
use Spatie\QueryBuilder\QueryBuilder;

class CategoryRepository extends BaseRepository implements CategoryRepositoryInterface
{

    public function __construct(Category $model)
    {
        $this->model = $model;
    }

    /**
     * Get all categories.
     *
     * @return QueryBuilder
     */

    public function getQueryBuilderCategory(): QueryBuilder
    {
        return QueryBuilder::for(subject: $this->model::class);
    }

}
