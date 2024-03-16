import 'package:core/entities.dart';

class RestaurantRepository {
  const RestaurantRepository();

  Future<Restaurant?> fetchRestaurant({required String restaurantId}) async {
    try {
      final restaurant = restaurants.firstWhere(
        (restaurant) => restaurant['id'] == restaurantId,
      );
      return Restaurant.fromJson(restaurant);
    } catch (err) {
      throw Exception('Failed to fetch the restaurant: $err');
    }
  }

  Future<List<Restaurant>> fetchRestaurants() async {
    try {
      return restaurants
          .map((restaurant) => Restaurant.fromJson(restaurant))
          .toList();
    } catch (err) {
      throw Exception('Failed to fetch the restaurants: $err');
    }
  }

  Future<List<Restaurant>> fetchPopularRestaurants() async {
    return fetchRestaurants();
  }

  Future<List<Restaurant>> fetchFeaturedRestaurants() async {
    return fetchRestaurants();
  }
}

final restaurants = [
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
            "description": "Two beef patties, special sauce, lettuce, cheese",
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
];
