import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'colors.dart';

class AppIcons {
  static const IconData home = Icons.home;
  static const IconData settings = Icons.settings;
  static const IconData profile = Icons.person;
  static const IconData notifications = Icons.notifications;
  static const IconData search = Icons.search;
  static  SvgPicture arithmeticIcon =  SvgPicture.asset(
      'assets/icons/arithmetic.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
  );
// Add more icons as needed
}
