import 'package:core/entities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../titles/section_title.dart';

class MenuItemModal extends StatelessWidget {
  const MenuItemModal({super.key, required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(menuItem.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    ),
                    IconButton.filled(
                      icon: const Icon(Icons.ios_share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      menuItem.name,
                      style: textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('\$${menuItem.price}', style: textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(menuItem.description ?? ''),
              const Divider(height: 24.0),
              ...(menuItem.options?.isNotEmpty ?? false)
                  ? [
                      const SectionTitle(title: 'Customizations'),
                      ...menuItem.options!.map(
                        (option) => RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: option,
                          groupValue: null,
                          onChanged: (value) {},
                          title: Text(
                            option.name,
                            style: textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text('+\$${option.additionalCost}'),
                        ),
                      ),
                      const Divider(height: 24.0),
                    ]
                  : [const SizedBox()],
              const SectionTitle(title: 'Special instructions'),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16.0),
                  hintText: 'Add a note',
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: colorScheme.background,
          height: 70.0,
          child: FilledButton(
            onPressed: () {},
            child: const Text('Add to cart'),
          ),
        ),
      ),
    );
  }
}
