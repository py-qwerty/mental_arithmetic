import 'package:flutter/material.dart';
import 'package:mental_arithmetic/app/playground/view/config/config_page.dart';
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
          final args = settings.arguments! as Map;
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) =>  PlayGroundPage.create(
              playGroundState: args['playGroundState'],
            ),
          );

        case ConfigPage.route:
          final args = settings.arguments! as Map;
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) =>  ConfigPage(
              operationMode: args['playMode'],
            ),
          );


      default:
        throw Exception('Page ${settings.name} does not exists');
    }
  }
}
