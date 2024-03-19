import 'package:core/entities.dart';
import 'package:flutter/material.dart';

import '../../screens/restaurant_details/restaurant_details_screen.dart';

class RestaurantPreviewCard extends StatelessWidget {
  const RestaurantPreviewCard({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RestaurantDetailsScreen(
                restaurantId: restaurant.id,
              );
            },
          ),
        );
      },
      child: Container(
        width: size.width,
        margin: const EdgeInsets.only(bottom: 8.0, right: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    restaurant.imageUrl!,
                    height: 125,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 8.0,
                  child: Chip(
                    side: BorderSide.none,
                    labelPadding: EdgeInsets.zero,
                    label: Text(
                      '2 offers available',
                      style: textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '\$0.49 Delivery Fee • 25-35 min',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 16.0,
                    backgroundColor: colorScheme.surfaceVariant,
                    foregroundColor: colorScheme.primary,
                    child: Text(
                      restaurant.rating.toString(),
                      style: textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
