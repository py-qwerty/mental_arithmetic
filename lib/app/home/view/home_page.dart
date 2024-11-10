import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_arithmetic/app/home/widgets/block_widget.dart';
import 'package:mental_arithmetic/app/theme/icons.dart';
import 'package:mental_arithmetic/config/environment.dart';

import '../../theme/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          title: const Text(EnvironmentConfig.appName),
        ),

        body: Center(
          child:_arithmetic(context)
        ),
      )
    );
  }


  Widget _arithmetic(BuildContext context) {
    return BlockWidget(
      onTap: () {
          Navigator.pushNamed(context, '/playground');
      },
      icon: AppIcons.arithmeticIcon,
    );
  }

}
