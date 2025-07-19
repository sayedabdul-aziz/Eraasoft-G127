import 'cart_item.dart';
import 'user.dart';

class Data {
  int? id;
  User? user;
  dynamic total;
  List<CartItem>? cartItems;

  Data({this.id, this.user, this.total, this.cartItems});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'] as int?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    total: json['total'] as dynamic,
    cartItems: (json['cart_items'] as List<dynamic>?)
        ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'total': total,
    'cart_items': cartItems?.map((e) => e.toJson()).toList(),
  };
}
