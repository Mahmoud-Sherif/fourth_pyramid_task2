class UserModel {
  final int id;
  final String name;
  final String phone;
  final String token;

  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      name: json['user']['name'],
      phone: json['user']['phone'],
      token: json['token'],
      createdAt: json['user']['created_at'],
      updatedAt: json['user']['updated_at'],
    );
  }
}
