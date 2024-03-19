import 'package:core/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/restaurant_repository.dart';
import '../../shared/widgets/section_title.dart';
import '../../state/restaurant_details/restaurant_details_bloc.dart';

part '_restaurant_details_app_bar.dart';
part '_restaurant_details_information.dart';
part '_restaurant_details_featured_menu_items.dart';
part '_restaurant_details_menu_sections.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({
    super.key,
    required this.restaurantId,
  });

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantDetailsBloc(
        restaurantRepository: context.read<RestaurantRepository>(),
      )..add(LoadRestaurantDetailsEvent(restaurantId: restaurantId)),
      child: const RestaurantDetailsView(),
    );
  }
}

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _RestaurantDetailsAppBar(),
      body: BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
        builder: (context, state) {
          if (state.status == RestaurantDetailsStatus.initial ||
              state.status == RestaurantDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == RestaurantDetailsStatus.loaded &&
              state.restaurant != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0).copyWith(top: 60.0),
              child: const Column(
                children: [
                  _RestaurantInformation(),
                  _FeaturedMenuItems(),
                  _MenuSections(),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Failed to load the restaurant'));
          }
        },
      ),
    );
  }
}
