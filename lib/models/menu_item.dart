import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final List<MenuItem>? subItems;
  final IconData icon;
  final String? routeName;

  MenuItem({
    required this.title,
    this.subItems,
    required this.icon,
    this.routeName,
  });
}
