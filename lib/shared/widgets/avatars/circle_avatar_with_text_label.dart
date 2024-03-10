import 'package:flutter/material.dart';

class CircleAvatarWithTextLabel extends StatelessWidget {
  const CircleAvatarWithTextLabel({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.radius = 24.0,
    this.onTap,
    this.showBorder = false,
  });

  final Widget icon;
  final String title;
  final String? subtitle;
  final double radius;
  final VoidCallback? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius + ((showBorder) ? 1 : 0),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: colorScheme.background,
              child: icon,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodySmall,
            )
        ],
      ),
    );
  }
}
