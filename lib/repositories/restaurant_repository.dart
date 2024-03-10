import 'package:core/entities.dart';

class RestaurantRepository {
  const RestaurantRepository();

  Future<Restaurant?> fetchRestaurant({required String restaurantId}) async {
    throw UnimplementedError();
    // try {
    //   final response = await dbClient.fetchOneById(
    //     entity: 'restaurants',
    //     id: restaurantId,
    //   );
    //   if (response == null) {
    //     throw RestaurantNotFound(restaurantId);
    //   }
    //   return Restaurant.fromJsonWithId(response.data, id: response.id);
    // } catch (err) {
    //   throw Exception('Failed to fetch the restaurant: $err');
    // }
  }

  Future<List<Restaurant>> fetchRestaurants() async {
    throw UnimplementedError();
    // try {
    //   final response = await dbClient.fetchAll(entity: 'restaurants');
    //   return response
    //       .map((e) => Restaurant.fromJsonWithId(e.data, id: e.id))
    //       .toList();
    // } catch (err) {
    //   throw Exception('Failed to fetch the restaurants: $err');
    // }
  }

  Future<List<Restaurant>> fetchPopularRestaurants() async {
    throw UnimplementedError();
    // try {
    //   final response = await dbClient.fetchAll(entity: 'restaurants');
    //   return response
    //       .map((e) => Restaurant.fromJsonWithId(e.data, id: e.id))
    //       .toList();
    // } catch (err) {
    //   throw Exception('Failed to fetch the restaurants: $err');
    // }
  }

  Future<List<Restaurant>> fetchFeaturedRestaurants() async {
    throw UnimplementedError();
    // try {
    //   final response = await dbClient.fetchAll(entity: 'restaurants');
    //   return response
    //       .map((e) => Restaurant.fromJsonWithId(e.data, id: e.id))
    //       .toList()
    //       .reversed
    //       .toList();
    // } catch (err) {
    //   throw Exception('Failed to fetch the restaurants: $err');
    // }
  }
}

class RestaurantNotFound implements Exception {
  final String restauranId;

  RestaurantNotFound(this.restauranId);

  @override
  String toString() =>
      'RestaurantNotFound: No restaurant found with id $restauranId';
}
