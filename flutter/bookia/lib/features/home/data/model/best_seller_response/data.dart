import 'product.dart';

class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products: (json['products'] as List<dynamic>?)
        ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'products': products?.map((e) => e.toJson()).toList(),
  };
}
