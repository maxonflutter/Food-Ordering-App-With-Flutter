part of 'home_screen.dart';

class _FeaturedRestaurants extends StatelessWidget {
  const _FeaturedRestaurants();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    const height = 185.0;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Featured on Hungry',
              action: 'See all',
              onPressed: () {},
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.featuredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = state.featuredRestaurants[index];
                  return SizedBox(
                    width: size.width * 0.8,
                    child: RestaurantPreviewCard(restaurant: restaurant),
                  );
                },
              ),
            ),
            Divider(
              color: colorScheme.surfaceVariant,
              indent: 8.0,
              endIndent: 8.0,
            ),
          ],
        );
      },
    );
  }
}
