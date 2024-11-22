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
  static SvgPicture multiply =  SvgPicture.asset(
      'assets/icons/multiply.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
      width: 40,
  );
  static SvgPicture division =  SvgPicture.asset(
      'assets/icons/divide.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
    width: 50,
  );
  static SvgPicture subtract =  SvgPicture.asset(
      'assets/icons/subtract.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
    width: 40,
  );
  static SvgPicture percent =  SvgPicture.asset(
      'assets/icons/percent.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
    width: 30,
  );
  static SvgPicture additional =  SvgPicture.asset(
      'assets/icons/addition.svg',
      semanticsLabel: 'Arithmetic Icon',
      colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn,),
      width: 40,
  );
  static SvgPicture withSound =  SvgPicture.asset(
    'assets/icons/sound_min.svg',
    semanticsLabel: 'Arithmetic Icon',
    colorFilter: const ColorFilter.mode(AppColors.detailsColor, BlendMode.srcIn,),
    width: 40,
  );
  static SvgPicture withoutSound =  SvgPicture.asset(
    'assets/icons/sound_mute.svg',
    semanticsLabel: 'Arithmetic Icon',
    colorFilter: const ColorFilter.mode(AppColors.detailsColor, BlendMode.srcIn,),
    width: 40,
  );
  static SvgPicture arrowRight =  SvgPicture.asset(
    'assets/icons/arrow-right.svg',
    semanticsLabel: 'Arithmetic Icon',
    colorFilter: const ColorFilter.mode(AppColors.detailsColor, BlendMode.srcIn,),
    width: 40,
  );
  static SvgPicture arrowLeft =  SvgPicture.asset(
    'assets/icons/arrow-left.svg',
    semanticsLabel: 'Arithmetic Icon',
    colorFilter: const ColorFilter.mode(AppColors.detailsColor, BlendMode.srcIn,),
    width: 40,
  );
// Add more icons as needed
}
