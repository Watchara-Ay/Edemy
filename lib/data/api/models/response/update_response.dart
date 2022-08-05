import 'package:flutter/cupertino.dart';

class updateResponse {
  final bool success;

  updateResponse({
    required this.success,
  });

  factory updateResponse.fromJson(Map<String, dynamic> json) {
    return updateResponse(
      success: json['success'],
    );
  }
}
