import 'package:flutter/material.dart';
import 'package:rko/presentation/widgets/pill_shaped_button/pill_shaped_button_primary.dart';
import 'package:rko/presentation/widgets/pill_shaped_button/pill_shaped_button_secondary.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.primaryOnTap,
    this.primaryTitle,
    this.primaryIcon,
    this.showSecondary = true,
    super.key,
  });

  final bool showSecondary;

  final String? primaryTitle;
  final IconData? primaryIcon;
  final VoidCallback primaryOnTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100,
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showSecondary)
            const PillShapedButtonSecondary()
          else
            const SizedBox(),
          PillShapedButtonPrimary(
            title: primaryTitle,
            onTap: primaryOnTap,
            icon: primaryIcon,
          ),
        ],
      ),
    );
  }
}
