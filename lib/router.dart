import 'package:flutter/material.dart';
import 'package:phonebookapp/features/home/home.view.dart';

class Router {
  static Map<String, Widget Function(BuildContext)> init() {
    final routes = {
      HomePage.name: (c) => const HomePage(),
    };

    return routes;
  }
}
