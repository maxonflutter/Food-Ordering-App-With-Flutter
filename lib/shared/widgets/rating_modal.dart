import 'package:flutter/material.dart';

import 'slider_with_division_labels.dart';

class RatingModal extends StatelessWidget {
  const RatingModal({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Rating',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Divider(
              color: colorScheme.surfaceVariant,
              height: 32.0,
            ),
            SliderWithDivisionLabels(
              min: 0.0,
              max: 5.0,
              onChanged: (value) {
                debugPrint('Rating: $value');
              },
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48.0),
              ),
              onPressed: () {},
              child: const Text('Apply'),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(48.0),
              ),
              onPressed: () {},
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
