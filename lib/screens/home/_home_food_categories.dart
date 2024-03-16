part of 'home_screen.dart';

class _FoodCategories extends StatelessWidget {
  const _FoodCategories();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: state.foodCategories.take(5).map(
            (category) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: colorScheme.background,
                        child: Image.asset(category.imageUrl),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        category.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
