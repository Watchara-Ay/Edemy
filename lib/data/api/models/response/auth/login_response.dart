class LoginResponse {
  final String token;
  final bool success;
  final String tokenType;
  final dynamic expiresIn;

  const LoginResponse({
    required this.token,
    required this.success,
    required this.tokenType,
    required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      success: json['success'],
      tokenType: json['tokenType'],
      expiresIn: json['expiresIn'],
    );
  }

}