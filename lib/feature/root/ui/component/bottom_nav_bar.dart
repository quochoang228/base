import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.items,
    super.key,
  });

  final int currentIndex;
  final ValueSetter<int> onTap;

  final List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: BaseColors.backgroundWhite,
        selectedItemColor: BaseColors.primary,
        selectedLabelStyle: BaseStyle.labelVerySmall,


        unselectedItemColor:  BaseColors.textSubtitle,
        unselectedLabelStyle: BaseStyle.labelVerySmall,

        // enableFeedback: true,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}