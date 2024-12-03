@extends('layouts.frontend')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Show Events
                            <a href="{{ url('events') }}" class="btn btn-danger float-end">Back</a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" value="{{ $event->name }}" readonly />
                        </div>
                        <div class="mb-3">
                            <label>Description</label>
                            <textarea name="description" rows="3" class="form-control" readonly>{!! $event->description !!}</textarea>
                        </div>
                        <div class="mb-3">
                            <label>Date</label>
                            <input type="date" name="date" class="form-control" value="{{ $event->date }}" readonly />
                        </div>
                        <div class="mb-3">
                            <label>Time</label>
                            <input type="time" name="time" class="form-control" value="{{ $event->time }}" readonly />
                        </div>
                        <div class="mb-3">
                            <label>Location</label>
                            <input type="text" name="location" class="form-control" value="{{ $event->location }}" readonly />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>    
@endsection