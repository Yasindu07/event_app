@extends('layouts.frontend')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Edit Event
                            <a href="{{ url('events') }}" class="btn btn-danger float-end">Back</a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('events.update', $event->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="mb-3">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" value="{{ $event->name }}" />
                                @error('name') <span class="text-danger">{{ $message }}</span>@enderror
                            </div>
                            <div class="mb-3">
                                <label>Description</label>
                                <textarea name="description" rows="3" class="form-control">{!! $event->description !!}</textarea>
                                @error('description') <span class="text-danger">{{ $message }}</span> @enderror
                            </div>
                            <div class="mb-3">
                                <label>Date</label>
                                <input type="date" name="date" class="form-control" value="{{ $event->date }}"/>
                                @error('date') <span class="text-danger">{{ $message }}</span> @enderror
                            </div>
                            <div class="mb-3">
                                <label>Time</label>
                                <input type="time" name="time" class="form-control" value="{{ $event->time }}"/>
                                @error('time') <span class="text-danger">{{ $message }}</span> @enderror
                            </div>
                            <div class="mb-3">
                                <label>Location</label>
                                <input type="text" name="location" class="form-control" value="{{ $event->location }}"/>
                                @error('location') <span class="text-danger">{{ $message }}</span> @enderror
                            </div>

                            <!-- Display the current image (if exists) -->
                            <div class="mb-3">
                                <label>Current Event Image</label><br>
                                @if($event->image)
                                    <img src="{{ asset('storage/' . $event->image) }}" width="200" alt="Event Image">
                                @else
                                    <p>No image available</p>
                                @endif
                            </div>

                            <div class="mb-3">
                                <label>Update Event Image</label>
                                <input type="file" name="image" class="form-control" />
                                @error('image') <span class="text-danger">{{ $message }}</span> @enderror
                            </div>

                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
