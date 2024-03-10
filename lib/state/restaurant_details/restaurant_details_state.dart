part of 'restaurant_details_bloc.dart';

enum RestaurantDetailsStatus { initial, loading, loaded, error }

class RestaurantDetailsState extends Equatable {
  final RestaurantDetailsStatus status;
  final Restaurant? restaurant;

  const RestaurantDetailsState({
    this.status = RestaurantDetailsStatus.initial,
    this.restaurant,
  });

  RestaurantDetailsState copyWith({
    RestaurantDetailsStatus? status,
    Restaurant? restaurant,
  }) {
    return RestaurantDetailsState(
      status: status ?? this.status,
      restaurant: restaurant ?? this.restaurant,
    );
  }

  @override
  List<Object?> get props => [status, restaurant];
}
