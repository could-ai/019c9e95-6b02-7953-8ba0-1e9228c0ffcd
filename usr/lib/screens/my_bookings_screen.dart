import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../models/booking.dart';
import '../models/train.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  final _service = MockDataService();
  late List<Booking> _bookings;
  late List<Train> _trains;

  @override
  void initState() {
    super.initState();
    _bookings = _service.getUserBookings('1'); // Mock user ID
    _trains = _service.getTrains();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Bookings')),
      body: _bookings.isEmpty
          ? const Center(child: Text('No bookings found'))
          : ListView.builder(
              itemCount: _bookings.length,
              itemBuilder: (context, index) {
                final booking = _bookings[index];
                final train = _trains.firstWhere((t) => t.id == booking.trainId);
                return Card(
                  child: ListTile(
                    title: Text(train.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${train.fromStation} to ${train.toStation}'),
                        Text('Seats: ${booking.seatNumbers.join(', ')}'),
                        Text('Status: ${booking.status}'),
                      ],
                    ),
                    trailing: Text('\$${booking.totalPrice}'),
                  ),
                );
              },
            ),
    );
  }
}
