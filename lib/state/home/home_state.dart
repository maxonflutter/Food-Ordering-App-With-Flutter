part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<FoodCategory> foodCategories;
  final List<Restaurant> popularRestaurants;
  final List<Restaurant> featuredRestaurants;
  final List<dynamic> shopsNearby;

  const HomeState({
    this.status = HomeStatus.initial,
    this.foodCategories = const [],
    this.popularRestaurants = const [],
    this.featuredRestaurants = const [],
    this.shopsNearby = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<FoodCategory>? foodCategories,
    List<Restaurant>? popularRestaurants,
    List<Restaurant>? featuredRestaurants,
    List<dynamic>? shopsNearby,
  }) {
    return HomeState(
      status: status ?? this.status,
      foodCategories: foodCategories ?? this.foodCategories,
      popularRestaurants: popularRestaurants ?? this.popularRestaurants,
      featuredRestaurants: featuredRestaurants ?? this.featuredRestaurants,
      shopsNearby: shopsNearby ?? this.shopsNearby,
    );
  }

  @override
  List<Object?> get props => [
        status,
        foodCategories,
        popularRestaurants,
        featuredRestaurants,
        shopsNearby,
      ];
}
