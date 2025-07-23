class HomeEvent {}

class GetHomeDataEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {
  final int productId;
  AddToWishlistEvent({required this.productId});
}

class AddToCartEvent extends HomeEvent {
  final int productId;
  AddToCartEvent({required this.productId});
}
