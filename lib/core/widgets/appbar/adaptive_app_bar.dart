import 'package:flutter/material.dart';
import 'package:main_character/app/theme/app_text_theme/app_text_theme.dart';
import 'package:main_character/core/extension/build_context_extension.dart';

class AdaptiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String text;
  const AdaptiveAppBar({
    super.key,
    this.actions,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: context.textTheme.titleMediumPlus,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
