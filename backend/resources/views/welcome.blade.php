<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Event Admin Panel</title>

        <link rel="icon" href="images/example.png">
        
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: 'figtree', sans-serif;
            }

            .carousel-container {
                position: relative;
            }

            .carousel-inner img {
                -webkit-filter: grayscale(90%);
                filter: grayscale(90%);
                width: 100%;
                margin: auto;
                height: 100vh; 
            }

            .carousel-caption h3 {
                color: #fff !important;
            }

            
            .top-left-text {
                position: absolute;
                top: 10px;
                left: 20px;
                font-size: 40px;
                font-weight: bold;
                color: hsl(0, 0%, 100%); 
                z-index: 2;
                
            }

            .welcome-note {
                font-size: 50px;
                font-weight: bold;
                color: hsl(0, 0%, 100%);
                position: fixed;
                top: 40%;
                left: 50%;
                transform: translateX(-50%);
                z-index: 2;
                text-align: center;
            }

            .btn-container {
                position: fixed;
                top: 55%;
                left: 50%;
                transform: translateX(-50%);
                z-index: 2;
                text-align: center;
            }

            .btn-custom {
                border-radius: 25px;
                background-color: white;
                color: black;
                border: 2px solid black;
                padding: 12px 30px;
                font-size: 18px;
                text-transform: uppercase;
                margin: 10px;
                transition: all 0.3s ease;
            }

            .btn-custom:hover {
                background-color: black;
                color: white;
            }

            @media (max-width: 600px) {
                .carousel-caption {
                    display: none; 
                }
                .welcome-note {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>
        
        @if (Route::has('login'))
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
              
                
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="images/events4.jpg" alt="img1" style="height: 100vh">
                    </div>
              
                    <div class="item">
                        <img src="images/event1.jpg" alt="img2" style="height: 100vh">
                    </div>
              
                    <div class="item">
                        <img src="images/events5.jpg" alt="img3" style="height: 100vh">
                    </div>
                </div>
              
                
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            
            <div class="top-left-text">
                EventLK
            </div>

            
            <div class="welcome-note">
                <p>Welcome EventLK Admin Panel! Please log in or register to continue.</p>
            </div>
            <div class="btn-container">
                @auth
                    <a href="{{ url('/dashboard') }}" class="btn-custom">
                        Dashboard
                    </a>
                @else
                    <a href="{{ route('login') }}" class="btn-custom">
                        Log in
                    </a>
                    @if (Route::has('register'))
                        <a href="{{ route('register') }}" class="btn-custom">
                            Register
                        </a>
                    @endif
                @endauth
            </div>
        @endif
    </body>
</html>
