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
