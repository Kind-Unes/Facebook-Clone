import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTab extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final IconData regularIcon;
  const MyTab({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.regularIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: FaIcon(
        isSelected ? icon : regularIcon,
        color: isSelected
            ? MyColors.primaryColor
            : const Color.fromARGB(255, 136, 136, 136),
      ),
    );
  }
}
