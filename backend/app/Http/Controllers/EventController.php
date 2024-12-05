<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $events = Event::paginate(5);
        return view('events.index', ['events' => $events]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('events.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'description' => 'required',
                'date' => 'required|date',
                'time' => 'required|date_format:H:i',
                'location' => 'required',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]
        );

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('event_images', 'public');
        }

        Event::create([
            'name' => $request->name,
            'description' => $request->description,
            'date' => $request->date,
            'time' => $request->time,
            'location' => $request->location,
            'image' => $imagePath,
        ]);

        return redirect('/events')->with('status', 'Event created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Event $event)
    {
        return view('events.show', compact('event'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Event $event)
    {
        return view('events.edit', compact('event'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Event $event)
    {
        $request->validate(
            [
                'name' => 'required',
                'description' => 'required',
                'date' => 'required|date|after_or_equal:'.now()->format('Y-m-d'),
                'time' => 'required',
                'location' => 'required',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]
        );

        $imagePath = $event->image;
        if ($request->hasFile('image')) {

            if ($imagePath) {
                Storage::disk('public')->delete($imagePath);
            }


            $imagePath = $request->file('image')->store('event_images', 'public');
        }

        $event->update([
            'name' => $request->name,
            'description' => $request->description,
            'date' => $request->date,
            'time' => $request->time,
            'location' => $request->location,
            'image' => $imagePath,
        ]);

        return redirect('/events')->with('status', 'Event updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Event $event)
    {
        $event->delete();
        return redirect('/events')->with('status', 'Event deleted successfully.');
    }

    public function showEvent()
{
    $events = Event::all();

    
    foreach ($events as $event) {
        if ($event->image) {
            $event->imageUrl = Storage::url($event->image);
        }
    }

    return response()->json($events);
}

}
