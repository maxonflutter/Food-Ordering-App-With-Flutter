part of 'home_screen.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: 80.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Deliver now',
            style: textTheme.bodyLarge,
          ),
          Row(
            children: [
              Text(
                'Your location',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.expand_more,
                color: colorScheme.onBackground,
              ),
            ],
          ),
        ],
      ),
      actions: [
        Switch(
          value: true,
          onChanged: (value) {},
          thumbIcon: const MaterialStatePropertyAll(
              // true ?
              Icon(Icons.delivery_dining)
              //  : Icon(Icons.shopping_cart),
              ),
        ),
        const SizedBox(width: 8.0),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(
            bottom: 4.0,
          ),
          child: TextFormField(
            onTap: () {},
            decoration: const InputDecoration(
              hintText: 'Search for restaurants, dishes...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(128.0);
}
