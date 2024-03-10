part of 'home_screen.dart';

class _ShopsNearby extends StatelessWidget {
  const _ShopsNearby();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(
              title: 'Shops near you',
              action: 'See all',
              onPressed: () {},
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [...state.shopsNearby, ...state.shopsNearby].map(
                  (shop) {
                    return Container(
                      margin: const EdgeInsets.only(right: 12.0),
                      child: CircleAvatarWithTextLabel(
                        radius: 36.0,
                        title: shop['title'],
                        subtitle: shop['subtitle'],
                        icon: ClipOval(child: Image.asset(shop['imageUrl'])),
                        showBorder: true,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            const SizedBox(height: 16.0),
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
