class SliderModel {
  String? image;

  SliderModel({this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      SliderModel(image: json['image'] as String?);

  Map<String, dynamic> toJson() => {'image': image};
}
