import 'package:base_ui/base_ui.dart';

import '../../../generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Mine extends StatelessWidget {
  const Mine({
    super.key,
    this.icon,
    this.onPress,
    required this.label,
    this.labelColor,
    this.labelTextStyle,
    this.content,
    this.contentTextStyle,
    this.subLabel,
    this.subLabelTextStyle,
    this.backgroundColor = Colors.transparent,
    this.iconRight,
    this.showIconRight = true,
    this.dividerColor,
    this.showBorder = true,
  });

  final Widget? icon;
  final Function? onPress;
  final String label;
  final Color? labelColor;
  final TextStyle? labelTextStyle;
  final String? subLabel;
  final TextStyle? subLabelTextStyle;
  final String? content;
  final TextStyle? contentTextStyle;
  final Color backgroundColor;
  final Widget? iconRight;
  final bool showIconRight;
  final Color? dividerColor;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: ColoredBox(
        color: backgroundColor,
        child: Container(
          padding: const EdgeInsets.only(
            right: BaseSpacing.spacing4,
            top: BaseSpacing.spacing35,
            bottom: BaseSpacing.spacing35,
          ),
          margin: const EdgeInsets.only(left: BaseSpacing.spacing4),
          // decoration: BoxDecoration(
          //   color: backgroundColor,
          //   border: Border(
          //     bottom: BorderSide(color: BaseColors.borderDivider),
          //   ),
          // ),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: showBorder
                ? BorderDirectional(
              bottom: BorderSide(color: dividerColor ?? BaseColors.borderDivider, width: 1),
            )
                : const BorderDirectional(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon ?? const SizedBox.shrink(),
              icon != null ? const Gap(BaseSpacing.spacing3) : const SizedBox.shrink(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label,
                            style: labelTextStyle ??
                                BaseStyle.bodyLarge.copyWith(
                                      color: labelColor ?? BaseColors.textLabel,
                                    ),
                          ),
                          content != null
                              ? Text(
                                  content!,
                                  maxLines: 1,
                                  style: contentTextStyle ?? BaseStyle.bodyMedium.copyWith(color: BaseColors.textSubtitle, overflow: TextOverflow.ellipsis),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    subLabel != null
                        ? Text(
                            subLabel!,
                            style: subLabelTextStyle ??
                                BaseStyle.bodyMedium.copyWith(
                                  color: BaseColors.textLabel,
                                ),
                          )
                        : const SizedBox.shrink(),
                    showIconRight ? iconRight ?? MyAssets.icons.arrowRight.svg() : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
