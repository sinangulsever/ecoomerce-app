<?php

namespace App\Http\Requests\Api\Auth;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
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
            "name" => ['required', 'string', 'max:255'],
            "email" => ['sometimes', 'string', 'email', 'max:255', 'unique:users,email,' . $this->user()->id],
            "password" => ['sometimes', 'min:5', 'confirmed'],
        ];
    }

    public function validated($key = null, $default = null): array
    {
        $data = parent::validated();

        if (isset($data['password'])) {
            $data['password'] = bcrypt($data['password']);
        }

        return $data;
    }

    public function attributes(): array
    {
        return [
            'name' => 'İsim',
            'email' => 'E-Posta',
            'password' => 'Şifre',
        ];
    }
}
