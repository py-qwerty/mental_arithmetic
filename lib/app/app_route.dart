import 'package:flutter/material.dart';
import 'package:mental_arithmetic/app/playground/view/play_ground_page.dart';


import 'home/view/home_page.dart';

abstract class AppRouter {
  static String get initialPage => HomePage.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomePage(),
        );

        case PlayGroundPage.route:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PlayGroundPage(),
        );


      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
