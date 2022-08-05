class addResponse {
  final bool success;

  addResponse({
    required this.success,
  });

  factory addResponse.fromJson(Map<String, dynamic> json) {
    return addResponse(
      success: json['success'],
    );
  }
}
