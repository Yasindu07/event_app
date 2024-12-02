<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;

class LoginController extends Controller
{
    
    public function loginCustomer(Request $request)
    {
        // Validate incoming request
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        try {
            // Attempt to authenticate the user
            $customer = Customer::where('email', $request->email)->first();

            if (!$customer || !Hash::check($request->password, $customer->password)) {
                Log::info('Login failed for email: ' . $request->email);
                return response()->json(['message' => 'Invalid credentials'], 401);
            }

            // Login the user
            Auth::login($customer);

            // Optional: Return user data and token if needed
            $token = $customer->createToken('CustomerApp')->plainTextToken;

            Log::info('User logged in successfully: ' . $customer->email);

            return response()->json([
                'message' => 'Login successful',
                'customer' => $customer,
                'token' => $token,
            ], 200);
        } catch (\Exception $e) {
            Log::error('Login error: ' . $e->getMessage());
            return response()->json(['message' => 'An error occurred'], 500);
        }
    }
    
}