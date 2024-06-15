import 'package:base_ui/base_ui.dart';
import 'package:base_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: BaseSpacing.spacing4),
          child: Text(
            title,
            style: BaseStyle.labelMedium.copyWith(
              color: BaseColors.textSubtitle,
            ),
          ),
        ),
        const Gap(BaseSpacing.spacing2),
        child,
      ],
    );
  }
}
