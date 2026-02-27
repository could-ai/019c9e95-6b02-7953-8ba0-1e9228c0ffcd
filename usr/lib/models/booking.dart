class Booking {
  final String id;
  final String userId;
  final String trainId;
  final List<String> seatNumbers;
  final DateTime bookingDate;
  final double totalPrice;
  final String status; // 'confirmed', 'cancelled', etc.

  Booking({
    required this.id,
    required this.userId,
    required this.trainId,
    required this.seatNumbers,
    required this.bookingDate,
    required this.totalPrice,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['userId'],
      trainId: json['trainId'],
      seatNumbers: List<String>.from(json['seatNumbers']),
      bookingDate: DateTime.parse(json['bookingDate']),
      totalPrice: json['totalPrice'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'trainId': trainId,
      'seatNumbers': seatNumbers,
      'bookingDate': bookingDate.toIso8601String(),
      'totalPrice': totalPrice,
      'status': status,
    };
  }
}