<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * Class Cart
 *
 * @property int $id
 * @property int $user_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @property User $user
 * @property Collection|CartItem[] $cart_items
 * @property Collection|Product[] $products
 *
 * @package App\Models
 */
class Cart extends Model
{
    protected $table = 'carts';

    protected $casts = [
        'user_id' => 'int'
    ];

    protected $fillable = [
        'user_id'
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function cart_items(): HasMany
    {
        return $this->hasMany(CartItem::class);
    }


    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'cart_items', 'cart_id', 'product_id')
            ->withPivot('quantity')
            ->withTimestamps();
    }

}
