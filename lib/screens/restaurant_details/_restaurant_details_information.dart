part of 'restaurant_details_screen.dart';

class _RestaurantInformation extends StatelessWidget {
  const _RestaurantInformation();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
      builder: (context, state) {
        final restaurant = state.restaurant!;
        return Column(
          children: [
            Text(
              restaurant.name,
              style: textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            RichText(
              text: TextSpan(
                style: textTheme.bodyMedium,
                text: restaurant.rating.toString(),
                children: [
                  const WidgetSpan(
                    child: Icon(
                      Icons.star,
                      size: 16.0,
                      color: Colors.amber,
                    ),
                  ),
                  TextSpan(text: ' (${restaurant.reviewsCount}+)'),
                  const TextSpan(text: ' • 2.3km away'),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '\$0.49 Delivery fee',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text('Pricing and fees'),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '15 min',
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Text('Delivery time'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        );
      },
    );
  }
}
