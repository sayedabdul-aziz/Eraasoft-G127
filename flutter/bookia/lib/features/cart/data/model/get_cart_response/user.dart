class User {
  int? userId;
  String? userName;

  User({this.userId, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json['user_id'] as int?,
    userName: json['user_name'] as String?,
  );

  Map<String, dynamic> toJson() => {'user_id': userId, 'user_name': userName};
}
