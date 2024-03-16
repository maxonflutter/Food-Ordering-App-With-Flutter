part of 'restaurant_details_bloc.dart';

abstract class RestaurantDetailsEvent extends Equatable {
  const RestaurantDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadRestaurantDetailsEvent extends RestaurantDetailsEvent {
  const LoadRestaurantDetailsEvent({required this.restaurantId});

  final String restaurantId;

  @override
  List<Object?> get props => [restaurantId];
}
