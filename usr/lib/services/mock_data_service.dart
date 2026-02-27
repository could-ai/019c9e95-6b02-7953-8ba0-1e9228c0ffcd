import '../models/train.dart';
import '../models/booking.dart';
import '../models/user.dart';

class MockDataService {
  static final MockDataService _instance = MockDataService._internal();
  factory MockDataService() => _instance;
  MockDataService._internal();

  final List<Train> _trains = [
    Train(
      id: '1',
      name: 'Express 101',
      fromStation: 'New York',
      toStation: 'Boston',
      departureTime: DateTime.now().add(const Duration(hours: 2)),
      arrivalTime: DateTime.now().add(const Duration(hours: 5)),
      availableSeats: 50,
      price: 75.0,
    ),
    Train(
      id: '2',
      name: 'Bullet 202',
      fromStation: 'Los Angeles',
      toStation: 'San Francisco',
      departureTime: DateTime.now().add(const Duration(hours: 4)),
      arrivalTime: DateTime.now().add(const Duration(hours: 7)),
      availableSeats: 30,
      price: 120.0,
    ),
    Train(
      id: '3',
      name: 'Regional 303',
      fromStation: 'Chicago',
      toStation: 'Detroit',
      departureTime: DateTime.now().add(const Duration(hours: 1)),
      arrivalTime: DateTime.now().add(const Duration(hours: 3)),
      availableSeats: 40,
      price: 60.0,
    ),
  ];

  final List<Booking> _bookings = [];
  final List<User> _users = [
    User(id: '1', email: 'user@example.com', name: 'John Doe'),
  ];

  List<Train> getTrains() => _trains;

  List<Train> searchTrains(String from, String to, DateTime date) {
    return _trains.where((train) =>
      train.fromStation.toLowerCase().contains(from.toLowerCase()) &&
      train.toStation.toLowerCase().contains(to.toLowerCase())
    ).toList();
  }

  bool bookSeats(String trainId, List<String> seatNumbers, String userId) {
    final train = _trains.firstWhere((t) => t.id == trainId);
    if (train.availableSeats >= seatNumbers.length) {
      // Simulate booking
      final booking = Booking(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        trainId: trainId,
        seatNumbers: seatNumbers,
        bookingDate: DateTime.now(),
        totalPrice: train.price * seatNumbers.length,
        status: 'confirmed',
      );
      _bookings.add(booking);
      return true;
    }
    return false;
  }

  List<Booking> getUserBookings(String userId) {
    return _bookings.where((b) => b.userId == userId).toList();
  }

  User? login(String email, String password) {
    // Simple mock login - in real app, this would check password
    return _users.firstWhere((u) => u.email == email);
  }
}