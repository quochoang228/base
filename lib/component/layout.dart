import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    this.title,
    this.action,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = CoreColors.white,
    this.bottomAction,
    this.isShowBottomAction = true,
    required this.body,
  });

  final String? title;
  final Widget body;
  final List<Widget>? action;
  final Widget? bottomAction;
  final bool isShowBottomAction;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null
            ? Text(
                title!,
                style: BaseStyle.headlineLarge,
              )
            : null,
        centerTitle: true,
        elevation: 0,
        actions: action,
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            padding: padding,
            margin: EdgeInsets.only(
              bottom: bottomAction != null ? kBottomNavigationBarHeight + 16 : 0
            ),
            child: body,
          ),
          bottomAction != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: isShowBottomAction ? kBottomNavigationBarHeight + 16  : 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: BaseSpacing.spacing2,
                      horizontal: BaseSpacing.spacing4,
                    ),
                    decoration: BoxDecoration(
                      color: BaseColors.backgroundWhite,
                      boxShadow: const [
                        BaseEffect.shadowNavBarEffect1,
                        BaseEffect.shadowNavigationBarEffect1,
                      ],
                      // border: Border(
                      //   top: BorderSide(
                      //     color: BaseColors.borderDefault,
                      //     width: 1,
                      //   ),
                      // ),
                    ),
                    child: bottomAction,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
