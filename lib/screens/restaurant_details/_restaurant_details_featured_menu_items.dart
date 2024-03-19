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

class FeaturedMenuItemCard extends StatelessWidget {
  const FeaturedMenuItemCard({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
                  menuItem.imageUrl!,
                  height: 125,
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 4.0,
                bottom: 4.0,
                child: IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem.name,
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${menuItem.price}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
