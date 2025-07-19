class DoctorModel {
  String? name;
  String? image;
  String? specialization;
  int? rating;
  String? email;
  String? phone1;
  String? phone2;
  String? bio;
  String? openHour;
  String? closeHour;
  String? address;
  String? uid;

  DoctorModel({
    this.name,
    this.image,
    this.specialization,
    this.rating,
    this.email,
    this.phone1,
    this.phone2,
    this.bio,
    this.openHour,
    this.closeHour,
    this.address,
    this.uid,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    specialization = json['specialization'];
    rating = json['rating'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    bio = json['bio'];
    openHour = json['openHour'];
    closeHour = json['closeHour'];
    address = json['address'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['specialization'] = specialization;
    data['rating'] = rating;
    data['email'] = email;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['bio'] = bio;
    data['openHour'] = openHour;
    data['closeHour'] = closeHour;
    data['address'] = address;
    data['uid'] = uid;
    return data;
  }

  Map<String, dynamic> toUpdateData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (image != null) data['image'] = image;
    if (specialization != null) data['specialization'] = specialization;
    if (rating != null) data['rating'] = rating;
    if (email != null) data['email'] = email;
    if (phone1 != null) data['phone1'] = phone1;
    if (phone1 != null) data['phone2'] = phone2;
    if (bio != null) data['bio'] = bio;
    if (openHour != null) data['openHour'] = openHour;
    if (closeHour != null) data['closeHour'] = closeHour;
    if (address != null) data['address'] = address;
    return data;
  }
}
