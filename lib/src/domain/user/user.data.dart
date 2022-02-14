class UserData {
  UserData({
    this.fullName,
    this.email,
    this.authProvider,
    this.profileImageUrl,
  });

  final AuthProvider? authProvider;
  final String? email;
  final String? fullName;
  final String? profileImageUrl;
}

enum AuthProvider {
  email,
  facebook,
  google,
  apple,
}