import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/restaurant_details/restaurant_details_screen.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: 'restaurant-details',
        path: '/restaurant-details/:id',
        builder: (BuildContext context, GoRouterState state) {
          final restaurantId = state.pathParameters['id']!;
          return RestaurantDetailsScreen(restaurantId: restaurantId);
        },
      ),
    ],
  );
}
