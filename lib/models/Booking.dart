import 'package:flutter/foundation.dart';

class Booking {
  final String email;
  final String phone;
  final int appelsin_userid;
  // tidspunkt should be a DateTime, not a String
  final DateTime tidspunkt;

  const Booking({
    required this.email,
    required this.phone,
    required this.appelsin_userid,
    required this.tidspunkt,
  });

  /// Flexible parser supporting multiple incoming formats
  /// - ISO 8601 strings (with or without timezone)
  /// - Unix epoch in seconds or milliseconds
  static DateTime _parseTidspunkt(dynamic value) {
    if (value == null) {
      throw ArgumentError('tidspunkt is null');
    }
    if (value is DateTime) return value;
    if (value is int) {
      // Heuristic: treat >= 10^12 as milliseconds, otherwise seconds
      final bool isMillis = value.abs() >= 1000000000000;
      final int millis = isMillis ? value : (value * 1000);
      return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
    }
    if (value is String) {
      final v = value.trim();
      if (v.isEmpty) {
        throw ArgumentError('tidspunkt string is empty');
      }
      // Try ISO 8601 first
      try {
        final dt = DateTime.parse(v);
        // Normalize to local for UI convenience
        return dt.isUtc ? dt.toLocal() : dt;
      } catch (_) {
        // Try as integer string (epoch)
        final numVal = int.tryParse(v);
        if (numVal != null) {
          final bool isMillis = numVal.abs() >= 1000000000000;
          final int millis = isMillis ? numVal : (numVal * 1000);
          return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true).toLocal();
        }
        // Add more custom formats here if backend sends them
        rethrow;
      }
    }
    throw ArgumentError('Unsupported tidspunkt type: ${value.runtimeType}');
  }

  factory Booking.fromJson(Map<String, dynamic> map) {
    return Booking(
      email: map['email'] as String,
      phone: map['phone'] as String,
      appelsin_userid: map['appelsin_userid'] as int,
      tidspunkt: _parseTidspunkt(map['tidspunkt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'appelsin_userid': appelsin_userid,
      // Send ISO 8601 in UTC to API for consistency
      'tidspunkt': tidspunkt.toUtc().toIso8601String(),
    };
  }
}