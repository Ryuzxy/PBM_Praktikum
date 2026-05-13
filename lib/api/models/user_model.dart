class User {
  final int id;
  final String name;
  final String username;
  final String roleName;
  final String className;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.roleName,
    required this.className,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      roleName: json['role'] != null ? json['role']['name'] ?? '' : '',
      className: (json['role'] != null && json['role']['class'] != null) 
          ? json['role']['class']['name'] ?? '' 
          : '',
    );
  }
}

class LoginResponse {
  final bool success;
  final String message;
  final String? token;
  final User? user;

  LoginResponse({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      token: json['data'] != null ? json['data']['token'] : null,
      user: json['data'] != null ? User.fromJson(json['data']['user']) : null,
    );
  }
}
