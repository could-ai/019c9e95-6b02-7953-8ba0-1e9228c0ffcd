class Train {
  final String id;
  final String name;
  final String fromStation;
  final String toStation;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final int availableSeats;
  final double price;

  Train({
    required this.id,
    required this.name,
    required this.fromStation,
    required this.toStation,
    required this.departureTime,
    required this.arrivalTime,
    required this.availableSeats,
    required this.price,
  });

  factory Train.fromJson(Map<String, dynamic> json) {
    return Train(
      id: json['id'],
      name: json['name'],
      fromStation: json['fromStation'],
      toStation: json['toStation'],
      departureTime: DateTime.parse(json['departureTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      availableSeats: json['availableSeats'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'fromStation': fromStation,
      'toStation': toStation,
      'departureTime': departureTime.toIso8601String(),
      'arrivalTime': arrivalTime.toIso8601String(),
      'availableSeats': availableSeats,
      'price': price,
    };
  }
}