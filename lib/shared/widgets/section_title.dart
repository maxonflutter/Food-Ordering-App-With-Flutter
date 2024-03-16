import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.action,
    this.onPressed,
  });

  final String title;
  final String? action;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
          if (action != null)
            TextButton(
              onPressed: onPressed,
              child: Text(
                action!,
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.secondary,
                  decoration: TextDecoration.underline,
                  decorationColor: colorScheme.secondary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
