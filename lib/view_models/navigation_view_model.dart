import 'package:flutter/material.dart';

class NavigationViewModel extends ChangeNotifier {
  void navigateTo(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
