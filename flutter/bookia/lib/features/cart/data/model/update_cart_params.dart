class UpdateCartParams {
  int? cartItemId;
  int? quantity;

  UpdateCartParams({this.cartItemId, this.quantity});

  factory UpdateCartParams.fromJson(Map<String, dynamic> json) {
    return UpdateCartParams(
      cartItemId: json['cart_item_id'] as int?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'cart_item_id': cartItemId,
    'quantity': quantity,
  };
}
