import 'package:flutter/material.dart';
import '../models/train.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final train = args['train'] as Train;
    final seats = args['seats'] as List<String>;

    return Scaffold(
      appBar: AppBar(title: const Text('Booking Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Colors.green),
            const SizedBox(height: 20),
            const Text(
              'Booking Confirmed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Train: ${train.name}'),
            Text('From: ${train.fromStation} to ${train.toStation}'),
            Text('Seats: ${seats.join(', ')}'),
            Text('Total Price: \$${train.price * seats.length}'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
