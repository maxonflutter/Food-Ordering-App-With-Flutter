import 'package:core/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/restaurant_repository.dart';

part 'restaurant_details_event.dart';
part 'restaurant_details_state.dart';

class RestaurantDetailsBloc
    extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  final RestaurantRepository _restaurantRepository;

  RestaurantDetailsBloc({
    required RestaurantRepository restaurantRepository,
  })  : _restaurantRepository = restaurantRepository,
        super(const RestaurantDetailsState()) {
    on<LoadRestaurantDetailsEvent>(_onLoadRestaurantDetails);
  }

  void _onLoadRestaurantDetails(
    LoadRestaurantDetailsEvent event,
    Emitter<RestaurantDetailsState> emit,
  ) async {
    debugPrint('LoadRestaurantDetailsEvent');
    emit(state.copyWith(status: RestaurantDetailsStatus.loading));
    try {
      final restaurant = await _restaurantRepository.fetchRestaurant(
        restaurantId: event.restaurantId,
      );

      emit(
        state.copyWith(
          status: RestaurantDetailsStatus.loaded,
          restaurant: restaurant,
        ),
      );
    } catch (err) {
      debugPrint(err.toString());
      emit(state.copyWith(status: RestaurantDetailsStatus.error));
    }
  }
}
