import 'repositories/food_category_repository.dart';
import 'repositories/repositories.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/navigation/app_router.dart';
import '../shared/theme/app_theme.dart';
import '../state/home/home_bloc.dart';

void main() async {
  final foodCategoryRepository = FoodCategoryRepository();
  final restaurantRepository = RestaurantRepository();

  return AppScreen(
    foodCategoryRepository: foodCategoryRepository,
    restaurantRepository: restaurantRepository,
  );
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.foodCategoryRepository,
    required this.restaurantRepository,
  });

  final FoodCategoryRepository foodCategoryRepository;
  final RestaurantRepository restaurantRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: foodCategoryRepository),
        RepositoryProvider.value(value: restaurantRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              restaurantRepository: restaurantRepository,
              foodCategoryRepository: foodCategoryRepository,
            )..add(LoadHomeEvent()),
          ),
        ],
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              title: 'Food Ordering App',
              theme: const AppTheme().themeData,
              routerConfig: AppRouter().router,
            );
          },
        ),
      ),
    );
  }
}
