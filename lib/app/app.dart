import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_arithmetic/app/theme/theme.dart';

import 'app_route.dart';
import 'home/view/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Atithmetics',
      theme: AppTheme.light,
      home: const HomePage(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
