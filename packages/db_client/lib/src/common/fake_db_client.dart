import 'package:uuid/uuid.dart';

import '../../common.dart';

class FakeDbClient implements DbClient {
  @override
  Future<String> add({
    required String entity,
    required Map<String, dynamic> data,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final id = const Uuid().v4();
    _dataStore.putIfAbsent(entity, () => []);
    data['id'] = id;
    _dataStore[entity]!.add(data);
    return id;
  }

  @override
  Future<void> set({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _dataStore.putIfAbsent(entity, () => []);
    data['id'] = id;
    final index = _dataStore[entity]!.indexWhere((doc) => doc['id'] == id);
    if (index != -1) {
      _dataStore[entity]![index] = data;
    } else {
      _dataStore[entity]!.add(data);
    }
  }

  @override
  Future<void> update({
    required String entity,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _dataStore.putIfAbsent(entity, () => []);
    final index = _dataStore[entity]!.indexWhere((doc) => doc['id'] == id);
    if (index != -1) {
      data.forEach((key, value) {
        // Check if the key exists and is a List in the document
        if (_dataStore[entity]![index][key] is List) {
          // Append the new value to the existing list
          List existingList = _dataStore[entity]![index][key];
          if (value is List) {
            // If the value is a list, extend the existing list with all new values
            existingList.addAll(value);
          } else {
            // If the value is a single item, add it to the existing list
            existingList.add(value);
          }
        } else {
          // If it's not a list, simply update the key with the new value
          _dataStore[entity]![index][key] = value;
        }
      });
    } else {
      throw Exception('Document not found');
    }
  }

  @override
  Future<void> deleteOneById({
    required String entity,
    required String id,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    _dataStore.putIfAbsent(entity, () => []);
    // Check if it exists
    final index = _dataStore[entity]!.indexWhere((doc) => doc['id'] == id);
    if (index == -1) {
      throw Exception('Document not found');
    }
    _dataStore[entity]!.removeAt(index);
  }

  @override
  Future<DbRecord?> fetchOneById({
    required String entity,
    required String id,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final data = _dataStore[entity]?.where((doc) {
      return doc['id'] == id;
    }).firstOrNull;

    return data != null ? DbRecord(id: id, data: data) : null;
  }

  @override
  Future<List<DbRecord>> fetchAll({required String entity}) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _dataStore[entity]
            ?.map((doc) => DbRecord(id: doc['id'], data: doc))
            .toList() ??
        [];
  }

  @override
  Future<List<DbRecord>> fetchAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    try {
      final collection = _dataStore[entity];
      if (collection == null) return [];

      List<Map<String, dynamic>> query;
      query = collection;

      filters.forEach(
        (key, value) {
          if (value is List<Map>) {
            for (var filter in value) {
              final queryType = filter['type'];
              final queryValue = filter['value'];
              query = _applyFilter(query, key, queryType, queryValue);
            }
          }
          if (value is Map) {
            final queryType = value['type'];
            final queryValue = value['value'];
            query = _applyFilter(query, key, queryType, queryValue);
            return;
          }
        },
      );

      return query.map((doc) => DbRecord(id: doc['id'], data: doc)).toList();
    } catch (err) {
      throw Exception('Error getting documents: $err');
    }
  }

  @override
  Stream<List<DbRecord>> streamAll({required String entity}) {
    final records = _dataStore[entity]
            ?.map((doc) => DbRecord(id: doc['id'], data: doc))
            .toList() ??
        [];

    return Stream.value(records);
  }

  @override
  Stream<List<DbRecord>> streamAllBy({
    required String entity,
    required Map<String, dynamic> filters,
  }) {
    final collection = _dataStore[entity];
    if (collection == null) return Stream.value([]);

    try {
      List<Map<String, dynamic>> query;
      query = collection;

      filters.forEach(
        (key, value) {
          if (value is List<Map>) {
            for (var filter in value) {
              final queryType = filter['type'];
              final queryValue = filter['value'];
              query = _applyFilter(query, key, queryType, queryValue);
            }
          }
          if (value is Map) {
            final queryType = value['type'];
            final queryValue = value['value'];
            query = _applyFilter(query, key, queryType, queryValue);
            return;
          }
        },
      );

      return Stream.value(
        query.map((doc) => DbRecord(id: doc['id'], data: doc)).toList(),
      );
    } catch (err) {
      throw Exception('Document not found: ${err.toString()}');
    }
  }

  @override
  Stream<DbRecord?> streamOneById({
    required String entity,
    required String id,
  }) {
    final data = _dataStore[entity]?.where((doc) {
      return doc['id'] == id;
    }).firstOrNull;

    final record = data != null ? DbRecord(id: id, data: data) : null;
    return Stream.value(record);
  }

  @override
  Future<List<DbRecord>> fetchAllFromBundle<T>({
    required String entity,
    required String bundleUrl,
  }) {
    return fetchAll(entity: entity);
  }

  @override
  Future<DbRecord?> fetchOneByIdFromBundle<T>({
    required String entity,
    required String id,
    required String bundleUrl,
  }) {
    return fetchOneById(entity: entity, id: id);
  }

  List<Map<String, dynamic>> _applyFilter(
    List<Map<String, dynamic>> query,
    String key,
    String queryType,
    dynamic queryValue,
  ) {
    switch (queryType) {
      case 'isGreaterThan':
        return query.where((doc) => doc[key] > queryValue).toList();
      case 'isGreaterThanOrEqualTo':
        return query.where((doc) => doc[key] >= queryValue).toList();
      case 'isLessThan':
        return query.where((doc) => doc[key] < queryValue).toList();
      case 'isLessThanOrEqualTo':
        return query.where((doc) => doc[key] <= queryValue).toList();
      case 'arrayContains':
        return query.where((doc) => doc[key].contains(queryValue)).toList();
      case 'isEqualTo':
        return query.where((doc) => doc[key] == queryValue).toList();
      case 'notEqualTo':
        return query.where((doc) => doc[key] != queryValue).toList();
      default:
        return query;
    }
  }

  Map<String, List<Map<String, dynamic>>> get dataStore => _dataStore;
  final Map<String, List<Map<String, dynamic>>> _dataStore = {
    'users': [],
    'foodCategories': [
      {
        'id': 'category_1',
        'name': 'Pizza',
        'imageUrl': 'assets/icons/pizza.png',
      },
      {
        'id': 'category_2',
        'name': 'Burgers',
        'imageUrl': 'assets/icons/burger.png',
      },
      {
        'id': 'category_3',
        'name': 'Sushi',
        'imageUrl': 'assets/icons/sushi.png',
      },
      {
        'id': 'category_4',
        'name': 'Dessert',
        'imageUrl': 'assets/icons/cake.png',
      },
      {
        'id': 'category_5',
        'name': 'Fast Food',
        'imageUrl': 'assets/icons/fries.png',
      },
    ],
    'restaurants': [
      {
        'id': 'restaurant_1',
        'name': 'Mad Pizza',
        'description': 'The best pizza in town',
        'category': {
          'id': 'category_1',
          "name": "Pizza",
          'imageUrl': "assets/images/pizza.png",
        },
        'imageUrl':
            'https://images.unsplash.com/photo-1571757392712-7c1052de7ce5?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'additionalImageUrls': [
          'https://images.unsplash.com/photo-1564936281403-f92f66f89ee0?q=80&w=1925&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1565748966642-cbfd46f9ba3a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ],
        'workingHours': [
          {
            'id': 'working_hours_1',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Monday',
          },
          {
            'id': 'working_hours_2',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Tuesday',
          },
          {
            'id': 'working_hours_3',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Wednesday',
          },
        ],
        'featuredMenuItems': [
          {
            "id": "menu_item_1",
            "sectionId": "section_1",
            "restaurantId": "restaurant_1",
            "name": "Margherita",
            "description": "Tomato sauce, mozzarella, basil",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 8.99,
            "options": [
              {
                "id": "option_1",
                "menuItemId": "menu_item_1",
                "name": "Extra cheese",
                "additionalCost": 1.99,
                "description": "Extra mozzarella cheese"
              },
              {
                "id": "option_2",
                "menuItemId": "menu_item_1",
                "name": "Extra sauce",
                "additionalCost": 0.99,
                "description": "Extra tomato sauce"
              },
              {
                "id": "option_3",
                "menuItemId": "menu_item_1",
                "name": "Extra toppings",
                "additionalCost": 2.99,
                "description": "Extra pepperoni, mushrooms, and bell peppers"
              },
            ],
            "available": true
          },
          {
            "id": "menu_item_2",
            "sectionId": "section_1",
            "restaurantId": "restaurant_1",
            "name": "Pepperoni",
            "description": "Tomato sauce, mozzarella, pepperoni",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 9.99,
            "options": [
              {
                "id": "option_4",
                "menuItemId": "menu_item_2",
                "name": "Extra meat",
                "additionalCost": 3.99,
                "description": "Extra pepperoni, sausage, and bacon"
              },
            ],
            "available": true
          },
          {
            "id": "menu_item_3",
            "sectionId": "section_1",
            "restaurantId": "restaurant_1",
            "name": "Vegetarian",
            "description": "Tomato sauce, mozzarella, mixed vegetables",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 9.99,
            "available": true
          },
          {
            "id": "menu_item_4",
            "sectionId": "section_1",
            "restaurantId": "restaurant_1",
            "name": "Hawaiian",
            "description": "Tomato sauce, mozzarella, ham, pineapple",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "price": 10.99,
            "available": true
          },
        ],
        'menu': [
          {
            "id": "section_1",
            "restaurantId": "restaurant_1",
            "name": "Specialty Pizzas",
            "description": "The best pizza in town",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "items": [
              {
                "id": "menu_item_1",
                "sectionId": "section_1",
                "restaurantId": "restaurant_1",
                "name": "Margherita",
                "description": "Tomato sauce, mozzarella, basil",
                "imageUrl":
                    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "price": 8.99,
                "options": [
                  {
                    "id": "option_1",
                    "menuItemId": "menu_item_1",
                    "name": "Extra cheese",
                    "additionalCost": 1.99,
                    "description": "Extra mozzarella cheese"
                  },
                  {
                    "id": "option_2",
                    "menuItemId": "menu_item_1",
                    "name": "Extra sauce",
                    "additionalCost": 0.99,
                    "description": "Extra tomato sauce"
                  },
                  {
                    "id": "option_3",
                    "menuItemId": "menu_item_1",
                    "name": "Extra toppings",
                    "additionalCost": 2.99,
                    "description":
                        "Extra pepperoni, mushrooms, and bell peppers"
                  },
                ],
                "available": true
              },
              {
                "id": "menu_item_2",
                "sectionId": "section_1",
                "restaurantId": "restaurant_1",
                "name": "Pepperoni",
                "description": "Tomato sauce, mozzarella, pepperoni",
                "imageUrl":
                    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "price": 9.99,
                "options": [
                  {
                    "id": "option_4",
                    "menuItemId": "menu_item_2",
                    "name": "Extra meat",
                    "additionalCost": 3.99,
                    "description": "Extra pepperoni, sausage, and bacon"
                  },
                ],
                "available": true
              },
            ]
          },
          {
            "id": "section_2",
            "restaurantId": "restaurant_1",
            "name": "Classic Pizzas",
            "description": "The best pizza in town",
            "imageUrl":
                "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "items": [
              {
                "id": "menu_item_3",
                "sectionId": "section_1",
                "restaurantId": "restaurant_1",
                "name": "Vegetarian",
                "description": "Tomato sauce, mozzarella, mixed vegetables",
                "imageUrl":
                    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "price": 9.99,
                "available": true
              },
              {
                "id": "menu_item_4",
                "sectionId": "section_1",
                "restaurantId": "restaurant_1",
                "name": "Hawaiian",
                "description": "Tomato sauce, mozzarella, ham, pineapple",
                "imageUrl":
                    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "price": 10.99,
                "available": true
              },
              {
                "id": "menu_item_5",
                "sectionId": "section_1",
                "restaurantId": "restaurant_1",
                "name": "Meat Lovers",
                "description":
                    "Tomato sauce, mozzarella, ham, pepperoni, sausage, bacon",
                "imageUrl":
                    "https://images.unsplash.com/photo-1601924582970-9238bcb495d9?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                "price": 11.99,
                "available": true
              },
            ],
          },
        ],
        'address': {
          "country": "USA",
          "city": "New York",
          "streetAddress": "5th Avenue",
          "streetNumber": "456",
          "postalCode": "10001",
        },
        'rating': 4.5,
        'reviewsCount': 12,
        'reviews': [
          {
            "id": "review_1",
            "restaurantId": "restaurant_1",
            "userId": "user_1",
            "content":
                "Absolutely loved the place! The ambiance is cozy and the food is delicious. Highly recommend the seafood pasta.",
            "rating": 4.8,
          },
          {
            "id": "review_2",
            "restaurantId": "restaurant_2",
            "userId": "user_1",
            "content":
                "Great vegan options! The veggie burger was one of the best I've had. Friendly staff too.",
            "rating": 4.5,
          },
          {
            "id": "review_3",
            "restaurantId": "restaurant_1",
            "userId": "user_1",
            "content":
                "Had to wait a bit longer than expected, but the food was worth it. The steak was cooked to perfection.",
            "rating": 4.0,
          },
        ],
      },
      {
        'id': 'restaurant_2',
        'name': 'Drip Burger',
        'description': 'The best burger in town',
        'category': {
          'id': 'category_1',
          "name": "Fast Food",
          'imageUrl': "assets/images/burger.png",
        },
        'imageUrl':
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'additionalImageUrls': [
          'https://images.unsplash.com/photo-1550547660-d9450f859349?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          'https://images.unsplash.com/photo-1565299507177-b0ac66763828?q=80&w=1922&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ],
        'workingHours': [
          {
            'id': 'working_hours_4',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Thursday',
          },
          {
            'id': 'working_hours_5',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Friday',
          },
          {
            'id': 'working_hours_6',
            'startTime': '08:00',
            'endTime': '17:00',
            'dayOfWeek': 'Saturday',
          }
        ],
        'menu': [
          {
            "id": "section_1",
            "restaurantId": "restaurant_2",
            "name": "Burgers",
            "description": "The best burgers in town",
            'imageUrl':
                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            "items": [
              {
                "id": "menu_item_6",
                "sectionId": "section_1",
                "restaurantId": "restaurant_2",
                "name": "Burger #1",
                "description":
                    "Two beef patties, special sauce, lettuce, cheese",
                'imageUrl':
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                "price": 4.99,
                "available": true
              },
              {
                "id": "menu_item_7",
                "sectionId": "section_1",
                "restaurantId": "restaurant_2",
                "name": "Cheeseburger",
                "description": "Beef patty, cheese, pickles, onions, ketchup",
                'imageUrl':
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                "price": 3.99,
                "available": true
              },
              {
                "id": "menu_item_8",
                "sectionId": "section_1",
                "restaurantId": "restaurant_2",
                "name": "Chicken Burger",
                "description": "Breaded chicken, lettuce, mayonnaise",
                'imageUrl':
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                "price": 5.99,
                "available": true
              },
            ],
          },
          {
            "id": "section_1",
            "restaurantId": "restaurant_2",
            "name": "Burgers",
            "description": "The best burgers in town",
            'imageUrl':
                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            "items": [
              {
                "id": "menu_item_9",
                "sectionId": "section_1",
                "restaurantId": "restaurant_2",
                "name": "Veggie Burger",
                "description": "Veggie patty, lettuce, tomato, pickles, onions",
                'imageUrl':
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                "price": 6.99,
                "available": true
              },
              {
                "id": "menu_item_10",
                "sectionId": "section_1",
                "restaurantId": "restaurant_2",
                "name": "Fish Burger",
                "description": "Breaded fish fillet, tartar sauce, cheese",
                'imageUrl':
                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1998&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                "price": 7.99,
                "available": true
              },
            ],
          },
        ],
        'address': {
          "country": "USA",
          "city": "New York",
          "streetAddress": "5th Avenue",
          "streetNumber": "123",
          "postalCode": "10001",
        },
        'rating': 4.0,
        'reviewsCount': 8,
        'reviews': [
          {
            "id": "review_2",
            "restaurantId": "restaurant_2",
            "userId": "user_1",
            "content":
                "Great vegan options! The veggie burger was one of the best I've had. Friendly staff too.",
            "rating": 4.5,
          },
        ],
      },
    ],
    'orders': [
      {
        'id': 'order_1',
        'userId': 'user_1',
        'restaurantId': 'restaurant_1',
        'items': [
          {
            'id': 'item_1',
            'name': 'Pizza Margherita',
            'price': 8.99,
            'quantity': 2,
          },
          {
            'id': 'item_2',
            'name': 'Spaghetti Carbonara',
            'price': 12.99,
            'quantity': 1,
          },
        ],
        'orderStatus': 'delivered',
        'paymentMethod': 'credit_card',
        'totalPrice': 30.97,
        'deliveryFee': 3.99,
        'taxAmount': 2.49,
        'discountAmount': 0.0,
        'requiredAmount': 34.46,
        'deliveryAddress': {
          'street': 'Via Roma 12',
          'city': 'Rome',
          'zip': '00100',
          'country': 'Italy',
        },
        'createdAt': '2021-07-20T00:00:00Z',
        'deliveredAt': '2021-07-20T00:30:00Z',
      },
      {
        'id': 'order_2',
        'userId': 'user_1',
        'restaurantId': 'restaurant_2',
        'items': [
          {
            'id': 'item_3',
            'name': 'Big Mac',
            'price': 3.99,
            'quantity': 2,
          },
          {
            'id': 'item_4',
            'name': 'French Fries',
            'price': 2.99,
            'quantity': 1,
          },
        ],
        'orderStatus': 'delivered',
        'paymentMethod': 'credit_card',
        'totalPrice': 10.97,
        'deliveryFee': 1.99,
        'taxAmount': 0.99,
        'discountAmount': 0.0,
        'requiredAmount': 12.96,
        'deliveryAddress': {
          'street': 'Via Milano 24',
          'city': 'Milan',
          'zip': '20100',
          'country': 'Italy',
        },
        'createdAt': '2021-07-20T00:00:00Z',
        'deliveredAt': '2021-07-20T00:30:00Z',
      },
    ],
  };
}
