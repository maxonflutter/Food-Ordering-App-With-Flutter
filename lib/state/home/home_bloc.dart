import 'package:bloc/bloc.dart';
import 'package:core/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../repositories/food_category_repository.dart';
import '../../repositories/restaurant_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FoodCategoryRepository _foodCategoryRepository;
  final RestaurantRepository _restaurantRepository;

  HomeBloc({
    required FoodCategoryRepository foodCategoryRepository,
    required RestaurantRepository restaurantRepository,
  })  : _foodCategoryRepository = foodCategoryRepository,
        _restaurantRepository = restaurantRepository,
        super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  void _onLoadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    debugPrint('LoadHomeEvent');
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final foodCategoriesFuture =
          _foodCategoryRepository.fetchFoodCategories();
      final popularRestaurantsFuture =
          _restaurantRepository.fetchPopularRestaurants();
      final featuredRestaurantsFuture =
          _restaurantRepository.fetchFeaturedRestaurants();

      final response = await Future.wait([
        foodCategoriesFuture,
        popularRestaurantsFuture,
        featuredRestaurantsFuture,
      ]);

      final foodCategories = response[0] as List<FoodCategory>;
      final popularRestaurants = response[1] as List<Restaurant>;
      final featuredRestaurants = response[2] as List<Restaurant>;
      final shopsNearby = [
        {
          'title': '7-Eleven',
          'subtitle': '10 mins',
          'imageUrl': 'assets/images/711.png',
        },
        {
          'title': 'Guardian',
          'subtitle': '15 mins',
          'imageUrl': 'assets/images/guardian.png',
        },
        {
          'title': 'Walgreens',
          'subtitle': '15 mins',
          'imageUrl': 'assets/images/walgreens.png',
        },
      ];

      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          foodCategories: foodCategories,
          popularRestaurants: popularRestaurants,
          featuredRestaurants: featuredRestaurants,
          shopsNearby: shopsNearby,
        ),
      );
    } catch (err) {
      debugPrint(err.toString());
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
