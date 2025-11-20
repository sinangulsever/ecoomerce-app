<?php

namespace App\Http\Requests\Api\Cart;

use App\Models\Product;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class AddCartRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'product_id' => ['required', 'exists:products,id'],
            'quantity' => ['required', 'integer', 'min:1'],
        ];
    }

    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            $productId = $this->input('product_id');
            $quantity = $this->input('quantity');

            $product = Product::find($productId);
            if ($product && $product->stock_quantity < $quantity) {
                $validator->errors()->add('quantity', 'Yeterli stok yok.');
            }
        });

    }

    public function attributes(): array
    {
        return [
            'product_id' => 'Ürün',
            'quantity' => 'Miktar',
        ];
    }
}
