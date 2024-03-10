part of 'home_screen.dart';

class _FoodCategories extends StatelessWidget {
  const _FoodCategories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: state.foodCategories.take(5).map(
            (category) {
              return Expanded(
                child: CircleAvatarWithTextLabel(
                  radius: 30.0,
                  title: category.name,
                  icon: Image.asset(category.imageUrl),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
