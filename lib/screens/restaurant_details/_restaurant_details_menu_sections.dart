part of 'restaurant_details_screen.dart';

class _MenuSections extends StatelessWidget {
  const _MenuSections();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
      builder: (context, state) {
        return Column(
          children: state.restaurant!.menu
              .map(
                (section) => Column(
                  children: [
                    const SizedBox(height: 16.0),
                    SectionTitle(title: section.name),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: section.items.length,
                      itemBuilder: (context, index) {
                        final menuItem = section.items[index];
                        return MenuItemCard(menuItem: menuItem);
                      },
                    ),
                    Divider(
                      color: colorScheme.surfaceVariant,
                      indent: 8.0,
                      endIndent: 8.0,
                    ),
                  ],
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => openMenuItemModal(context, menuItem),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuItem.name,
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('\$${menuItem.price.toString()}'),
                    Text(
                      menuItem.description ?? '',
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    menuItem.imageUrl!,
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> openMenuItemModal(BuildContext context, MenuItem menuItem) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return Container();
      },
    );
  }
}
