<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function index(){
        $customers = Customer::paginate(5);
        return view('customers.index', ['customers' => $customers]);
    }

    public function show(Customer $customer)
    {
        return view('customers.show', compact('customer'));
    }

    public function destroy(Customer $customer)
    {
        $customer->delete();
        return redirect('/customers')->with('status', 'Customer deleted successfully.');
    }
}
