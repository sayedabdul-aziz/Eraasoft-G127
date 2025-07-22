class PatientModel {
  String? name;
  String? image;
  String? age;
  String? email;
  String? phone;
  String? bio;
  String? city;
  String? uid;

  PatientModel({
    this.name,
    this.image,
    this.age,
    this.email,
    this.phone,
    this.bio,
    this.city,
    this.uid,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    age = json['age'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    city = json['city'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['age'] = age;
    data['email'] = email;
    data['phone'] = phone;
    data['bio'] = bio;
    data['city'] = city;
    data['uid'] = uid;
    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (image != null) data['image'] = image;
    if (age != null) data['age'] = age;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;
    if (bio != null) data['bio'] = bio;
    if (city != null) data['city'] = city;
    return data;
  }
}
