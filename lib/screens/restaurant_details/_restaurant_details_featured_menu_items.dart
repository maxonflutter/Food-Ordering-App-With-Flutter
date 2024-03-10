part of 'restaurant_details_screen.dart';

class _FeaturedMenuItems extends StatelessWidget {
  const _FeaturedMenuItems();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final colorScheme = Theme.of(context).colorScheme;
    const height = 185.0;
    return BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
      builder: (context, state) {
        return (state.restaurant?.featuredMenuItems.isNotEmpty ?? false)
            ? Column(
                children: [
                  const SectionTitle(title: 'Featured Items'),
                  SizedBox(
                    height: height,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.restaurant?.featuredMenuItems.length,
                      itemBuilder: (context, index) {
                        final menuItem =
                            state.restaurant?.featuredMenuItems[index];
                        return SizedBox(
                          width: size.width * 0.35,
                          child: FeaturedMenuItemCard(menuItem: menuItem!),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: colorScheme.surfaceVariant,
                    indent: 8.0,
                    endIndent: 8.0,
                  ),
                  const SizedBox(height: 16.0),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
