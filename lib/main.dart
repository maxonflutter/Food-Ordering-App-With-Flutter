import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/food_category_repository.dart';
import 'repositories/restaurant_repository.dart';
import 'screens/home/home_screen.dart';
import 'shared/theme/app_theme.dart';
import 'state/home/home_bloc.dart';

void main() {
  const foodCategoryRepository = FoodCategoryRepository();
  const restaurantRepository = RestaurantRepository();

  runApp(
    const AppScreen(
      foodCategoryRepository: foodCategoryRepository,
      restaurantRepository: restaurantRepository,
    ),
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
          // Global scope
          BlocProvider(
            create: (context) => HomeBloc(
              foodCategoryRepository: foodCategoryRepository,
              restaurantRepository: restaurantRepository,
            )..add(LoadHomeEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme().themeData,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
