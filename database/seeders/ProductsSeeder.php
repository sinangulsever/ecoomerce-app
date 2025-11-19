<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {


        foreach (Category::all() as $category) {

            $countProducts = $category->products()->count();

            if ($countProducts < 5) {
                $productsToCreate = 5 - $countProducts;
                $category->products()->createMany(
                    Product::factory()->count($productsToCreate)
                        ->make([
                            'category_id' => $category->id
                        ])->toArray()
                );
            }

        }

    }
}
