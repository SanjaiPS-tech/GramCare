import 'package:flutter/material.dart';
import '../../core/theme/elderly_theme_extensions.dart';

class ElderlyCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  const ElderlyCard({
    super.key,
    required this.child,
    this.onTap,
    this.color,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final elderlyTheme = ElderlyThemeExtension.of(context);

    return Card(
      elevation: elevation ?? 2,
      color: color,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(elderlyTheme.borderRadius),
        child: Padding(
          padding: padding ?? EdgeInsets.all(elderlyTheme.padding),
          child: child,
        ),
      ),
    );
  }
}
