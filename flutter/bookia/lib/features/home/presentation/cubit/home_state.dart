class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class AddedToWishlistCartState extends HomeState {
  final String message;
  AddedToWishlistCartState({required this.message});
}

class HomeErrorState extends HomeState {}
