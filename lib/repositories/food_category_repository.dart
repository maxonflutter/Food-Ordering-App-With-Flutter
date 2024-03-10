import 'package:core/entities.dart';

class FoodCategoryRepository {
  const FoodCategoryRepository();

  Future<List<FoodCategory>> fetchFoodCategories() async {
    throw UnimplementedError();
    // try {
    //   final response = await dbClient.fetchAll(entity: 'foodCategories');
    //   return response
    //       .map((e) => FoodCategory.fromJsonWithId(e.data, id: e.id))
    //       .toList();
    // } catch (err) {
    //   throw Exception('Failed to fetch the restaurants: $err');
    // }
  }
}
