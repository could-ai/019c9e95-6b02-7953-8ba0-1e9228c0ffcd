import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../models/train.dart';

class SearchTrainsScreen extends StatefulWidget {
  const SearchTrainsScreen({super.key});

  @override
  State<SearchTrainsScreen> createState() => _SearchTrainsScreenState();
}

class _SearchTrainsScreenState extends State<SearchTrainsScreen> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _service = MockDataService();
  List<Train> _trains = [];

  void _search() {
    setState(() {
      _trains = _service.searchTrains(
        _fromController.text,
        _toController.text,
        DateTime.now(), // For simplicity, using current date
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Trains')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fromController,
              decoration: const InputDecoration(labelText: 'From Station'),
            ),
            TextField(
              controller: _toController,
              decoration: const InputDecoration(labelText: 'To Station'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _search,
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _trains.length,
                itemBuilder: (context, index) {
                  final train = _trains[index];
                  return Card(
                    child: ListTile(
                      title: Text(train.name),
                      subtitle: Text('${train.fromStation} to ${train.toStation}'),
                      trailing: Text('$${train.price}'),
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/select-seat',
                        arguments: train,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}