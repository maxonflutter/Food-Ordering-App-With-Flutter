part of 'home_screen.dart';

class _ShopsNearby extends StatelessWidget {
  const _ShopsNearby();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 37,
                              child: CircleAvatar(
                                radius: 36,
                                backgroundColor: colorScheme.background,
                                child: ClipOval(
                                  child: Image.asset(shop['imageUrl']),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              shop['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              shop['subtitle'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall,
                            )
                          ],
                        ),
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
