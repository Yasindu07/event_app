@extends('layouts.frontend')
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Customers') }}
        </h2>
    </x-slot>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @section('content')
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            @session('status')
                            <div class="alert alert-success">
                                {{ session('status') }}
                            </div>
                            @endsession
            
                            <div class="card">
                                <div class="card-header">
                                    <h4>Customer List

                                    </h4>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>email</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($customers as $customer )
                                            <tr>
                                                <td>{{ $customer->id }}</td>
                                                <td>{{ $customer->name }}</td>
                                                <td>{{ $customer->email }}</td>
                                                <td>
                                                    <a href="{{ route('customers.show', $customer->id) }}" class="btn btn-info">Show</a>
                                                    <form action="{{ route('customers.destroy', $customer->id) }}" method="POST" class="d-inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
            
                                    {{ $customers->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endsection
        </div>
</x-app-layout>