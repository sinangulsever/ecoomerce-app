<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CartItemResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'product_id' => $this->resource->pivot->product_id,
            'quantity' => $this->resource->pivot->quantity,
            'price' => $this->resource->price,
            'total' => $this->resource->price * $this->resource->pivot->quantity,
        ];
    }
}
