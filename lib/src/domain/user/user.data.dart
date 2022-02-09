class UserData {
  UserData({
    required this.fullName,
    required this.email,
    required this.userType,
    required this.authProvider,
    required this.profileImageUrl,
  });

  final AuthProvider authProvider;
  final String email;
  final String fullName;
  final String profileImageUrl;
  final String userType;
}

enum AuthProvider {
  email,
  facebook,
  google,
  apple,
}
