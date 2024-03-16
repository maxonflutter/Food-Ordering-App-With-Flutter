part of 'home_screen.dart';

class _PopularRestaurants extends StatelessWidget {
  const _PopularRestaurants();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    const height = 200.0;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Popular near you',
              action: 'See all',
              onPressed: () {},
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.popularRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = state.popularRestaurants[index];
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
