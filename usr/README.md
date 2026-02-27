# Railway Reservation System

A fully functional Flutter web application for railway ticket booking and reservation management.

## Features

- User authentication (login)
- Search for trains by route
- Select and book seats
- View booking confirmations
- Manage personal bookings
- Responsive design for web

## Getting Started

This app uses mock data for demonstration. To enable full backend functionality:

1. Connect to Supabase for database and authentication
2. Deploy Edge Functions for API endpoints
3. Configure real-time updates

## Architecture

- **Frontend**: Flutter widgets with Material Design
- **State Management**: Local state with setState (can be upgraded to Provider/Bloc)
- **Data**: Mock services (replace with Supabase when connected)
- **Models**: Train, Booking, User classes

## Screens

- Login Screen
- Home Screen
- Search Trains Screen
- Select Seat Screen
- Booking Confirmation Screen
- My Bookings Screen