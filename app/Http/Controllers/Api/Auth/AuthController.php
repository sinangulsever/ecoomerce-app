<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Requests\Api\Auth\LoginRequest;
use App\Http\Requests\Api\Auth\RegisterRequest;
use App\Http\Requests\Api\Auth\UpdateUserRequest;
use App\Http\Resources\AuthResource;
use App\Http\Resources\UserResource;
use App\Services\UserService;
use App\Traits\ApiResponseTrait;
use Illuminate\Routing\Controller;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    use ApiResponseTrait;

    protected UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->middleware('auth:api', ['except' => ['register', 'login']]);
        $this->userService = $userService;
    }

    /**
     * Register a new user.
     *
     * @param RegisterRequest $request
     * @return JsonResponse
     */
    public function register(RegisterRequest $request): JsonResponse
    {
        $user = $this->userService->register($request->validated());
        return $this->successResponse(
            data: new UserResource($user),
            message: 'User registered successfully',
            httpCode: 201
        );
    }

    /**
     * Login a user and return a JWT token.
     *
     * @param LoginRequest $request
     * @return JsonResponse
     */
    public function login(LoginRequest $request): JsonResponse
    {
        $credentials = $request->only('email', 'password');

        if (!$token = auth('api')->attempt($credentials)) {
            return $this->unauthorizedResponse(message: 'Kullanıcı bulunamadı');
        }

        return $this->successResponse(
            data: new AuthResource([
                'token' => $token,
                'user' => getUser(),
            ]),
            message: 'User logged in successfully'
        );

    }

    /**
     * Get the authenticated user's profile.
     *
     * @return JsonResponse
     */
    public function profile(): JsonResponse
    {
        return $this->successResponse(
            data: new UserResource(getUser()),
            message: 'User profile retrieved successfully'
        );
    }

    /**
     * Update the authenticated user's profile.
     *
     * @param UpdateUserRequest $request
     * @return JsonResponse
     */
    public function updateProfile(UpdateUserRequest $request): JsonResponse
    {
        $user = $this->userService->updateUser(getUser(), $request->validated());
        return $this->successResponse(
            data: new UserResource($user),
            message: 'User profile updated successfully'
        );
    }
}
