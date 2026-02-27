import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_trains_screen.dart';
import 'screens/select_seat_screen.dart';
import 'screens/booking_confirmation_screen.dart';
import 'screens/my_bookings_screen.dart';

void main() {
  runApp(const RailwayReservationApp());
}

class RailwayReservationApp extends StatelessWidget {
  const RailwayReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Railway Reservation System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchTrainsScreen(),
        '/select-seat': (context) => const SelectSeatScreen(),
        '/confirmation': (context) => const BookingConfirmationScreen(),
        '/my-bookings': (context) => const MyBookingsScreen(),
      },
    );
  }
}