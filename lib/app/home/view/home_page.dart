import 'package:flutter/material.dart';
import 'package:mental_arithmetic/app/home/widgets/block_widget.dart';
import 'package:mental_arithmetic/app/theme/icons.dart';
import 'package:mental_arithmetic/config/environment.dart';
import '../../playground/cubit/play_ground_state.dart';
import '../../playground/view/config/config_page.dart';
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
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children:[
              _additionalPlay(context),
              _subtractPlay(context),
              _multiplyPlay(context),
              _divisionPlay(context),
              _percentPlay(context),
              _mixPlay(context),
            ]
          ),
        ),
      )
    );
  }

  Widget _additionalPlay(BuildContext context) {
    return BlockWidget(

      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.addition
            });
      },
      icon: AppIcons.additional,
    );
  }

  Widget _subtractPlay(BuildContext context) {
    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.subtraction
            });
      },
      icon: AppIcons.subtract,
    );
  }

  Widget _multiplyPlay(BuildContext context) {
    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.multiplication
            });
      },
      icon: AppIcons.multiply,
    );
  }

  Widget _divisionPlay(BuildContext context) {
    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.division
            });
      },
      icon: AppIcons.division,
    );
  }

  Widget _percentPlay(BuildContext context) {
    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.percentage
            });
      },
      icon: AppIcons.percent,
    );
  }

  Widget _mixPlay(BuildContext context) {
    return BlockWidget(
      onTap: () {
        Navigator.pushNamed(context, ConfigPage.route,
            arguments: {
              'playMode': OperationMode.mixed
            });
      },
      icon: AppIcons.arithmeticIcon,
    );
  }

}
