@extends('layouts.frontend')
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Events') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @section('content')
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            @if(session('status'))
                                <div class="alert alert-success">
                                    {{ session('status') }}
                                </div>
                            @endif

                            <div class="card">
                                <div class="card-header">
                                    <h4>Event List
                                        <a href="{{ url('events/create') }}" class="btn btn-primary float-end">Add Event</a>
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <table class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>Description</th>
                                                <th>Date</th>
                                                <th>Time</th>
                                                <th>Location</th>
                                                <th>Image</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($events as $event)
                                            <tr>
                                                <td>{{ $event->id }}</td>
                                                <td>{{ $event->name }}</td>
                                                <td>{{ $event->description }}</td>
                                                <td>{{ $event->date }}</td>
                                                <td>{{ $event->time }}</td>
                                                <td>{{ $event->location }}</td>
                                                
                                                
                                                <td>
                                                    @if($event->image)
                                                        <img src="{{ asset('storage/' . $event->image) }}" alt="Event Image" width="100" height="100">
                                                    @else
                                                        <span>No Image</span>
                                                    @endif
                                                </td>

                                                <td>
                                                    <a href="{{ route('events.edit', $event->id) }}" class="btn btn-success">Edit</a>
                                                    <a href="{{ route('events.show', $event->id) }}" class="btn btn-info">Show</a>
                                                    <form action="{{ route('events.destroy', $event->id) }}" method="POST" class="d-inline">
                                                        @csrf
                                                        @method('DELETE')
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>

                                    {{ $events->links() }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endsection
        </div>
    </div>
</x-app-layout>
