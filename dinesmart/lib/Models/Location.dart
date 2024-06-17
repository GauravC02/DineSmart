class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  }) {
    if (latitude < -90 || latitude > 90) {
      throw ArgumentError('Invalid latitude');
    }
    if (longitude < -180 || longitude > 180) {
      throw ArgumentError('Invalid longitude');
    }
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: (json['latitude'] as num?)?.toDouble() ??
          0.0, // Handle null or invalid values
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  double distanceTo(Location other) {
    return ((latitude - other.latitude) * (latitude - other.latitude) +
            (longitude - other.longitude) * (longitude - other.longitude))
        .sqrt();
  }
}

extension on double {
  double sqrt() => this > 0 ? this.toDouble().sqrt() : 0;
}
