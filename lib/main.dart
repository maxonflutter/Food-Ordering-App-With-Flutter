import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ordering_app_with_flutter_and_bloc/shared/theme/app_theme.dart';

import '../state/home/home_bloc.dart';
import 'repositories/food_category_repository.dart';
import 'repositories/restaurant_repository.dart';
import 'screens/home/home_screen.dart';

void main() async {
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
          BlocProvider(
            create: (context) => HomeBloc(
              restaurantRepository: restaurantRepository,
              foodCategoryRepository: foodCategoryRepository,
            )..add(LoadHomeEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Food Ordering App',
          // theme: AppTheme().themeData,
          home: HomeScreen(),
        ),
      ),
    );
  }
}



// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
