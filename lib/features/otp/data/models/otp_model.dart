class OTPModel {
  final String code;
  final String phoneNumber;
  final DateTime expiresAt;

  OTPModel({
    required this.code,
    required this.phoneNumber,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  bool isValid(String inputCode) {
    return code == inputCode && !isExpired;
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'phoneNumber': phoneNumber,
    'expiresAt': expiresAt.toIso8601String(),
  };
}