class User {
  int? id;
  String? name;
  String? email;
  dynamic address;
  dynamic city;
  dynamic phone;
  bool? emailVerified;
  String? image;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    address: json['address'] as dynamic,
    city: json['city'] as dynamic,
    phone: json['phone'] as dynamic,
    emailVerified: json['email_verified'] as bool?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'address': address,
    'city': city,
    'phone': phone,
    'email_verified': emailVerified,
    'image': image,
  };
}
