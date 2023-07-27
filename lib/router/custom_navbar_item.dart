import 'package:flutter/material.dart';

class CustomNavBarTabItem extends BottomNavigationBarItem {
  const CustomNavBarTabItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
  }) : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
