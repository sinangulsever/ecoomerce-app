<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Category>
 */
class CategoryFactory extends Factory
{
    protected $model = Category::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {

        $dataCategory = [
            'Elektronik', 'Aksesuar', 'Telefon', 'Giyim', 'Ev Eşyası', 'Kitap', 'Spor Malzemeleri', 'Oyuncak', 'Kozmetik', 'Mutfak Gereçleri', 'Bahçe Malzemeleri', 'Mobilya', 'Kırtasiye', 'Sağlık Ürünleri', 'Yiyecek & İçecek', 'Ayakkabı', 'Saat', 'Müzik Aletleri', 'Fotoğraf Ekipmanları', 'Otomobil Aksesuarları', 'Bebek Ürünleri'
        ];

        return [
            'name' => $this->faker->randomElement($dataCategory),
            'description' => $this->faker->sentence(5),
        ];
    }
}
