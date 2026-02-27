import 'package:flutter/material.dart';
import '../models/train.dart';
import '../services/mock_data_service.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  List<String> _selectedSeats = [];
  final _service = MockDataService();

  @override
  Widget build(BuildContext context) {
    final train = ModalRoute.of(context)!.settings.arguments as Train;

    return Scaffold(
      appBar: AppBar(title: Text('Select Seats - ${train.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Available Seats: ${train.availableSeats}'),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                ),
                itemCount: 40, // Simplified seat layout
                itemBuilder: (context, index) {
                  final seatNumber = 'A${index + 1}';
                  final isSelected = _selectedSeats.contains(seatNumber);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedSeats.remove(seatNumber);
                        } else if (_selectedSeats.length < 4) {
                          _selectedSeats.add(seatNumber);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(seatNumber),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedSeats.isNotEmpty
                  ? () {
                      final success = _service.bookSeats(train.id, _selectedSeats, '1'); // Mock user ID
                      if (success) {
                        Navigator.pushNamed(
                          context,
                          '/confirmation',
                          arguments: {
                            'train': train,
                            'seats': _selectedSeats,
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Booking failed')),
                        );
                      }
                    }
                  : null,
              child: Text('Book ${_selectedSeats.length} Seats'),
            ),
          ],
        ),
      ),
    );
  }
}