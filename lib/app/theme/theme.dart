import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      // FIXME - This will default in future versions
      // https://github.com/flutter/flutter/issues/127064
      useMaterial3: false,
      brightness: Brightness.light,
      textTheme: textTheme,
      iconTheme: iconTheme,
      progressIndicatorTheme: progressIndicatorTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      elevatedButtonTheme: elevatedButtonTheme,
      outlinedButtonTheme: outlinedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.selected)
              ? AppColors.blue
              : Colors.white,
        ),
        side: const BorderSide(color: AppColors.blue, width: 2),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.all(AppColors.detailsColor),
        splashRadius: 20,
        thumbColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) return AppColors.blue;
          return AppColors.furnitureColor;
        }),
      ),
    );
  }

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.blue),
      ),
      isDense: true,
      iconColor: AppColors.blue,
    );
  }

  static OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
          fontFamily: 'PlusJakartaSans',
        ),
        foregroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 49),
      ).copyWith(
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: AppColors.blue),
        ),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'PlusJakartaSans',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 48),
        elevation: 0,
      ).merge(
        ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.furnitureColor;
            }
            return AppColors.detailsColor;
          }),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        ),
      ),
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      backgroundColor:AppColors.decorationColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      elevation: 10,
      iconTheme: IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
    );
  }

  static TextTheme get textTheme {
    return const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 12,
      ),
    ).apply(
      bodyColor: AppColors.blue,
      fontFamily: 'PlusJakartaSans',
    );
  }

  // static ColorScheme get colorScheme {
  //   return ColorScheme.fromSwatch().copyWith(
  //     primary: AppColors.blue,
  //     secondary: AppColors.orange,
  //     tertiary: AppColors.greyLight,
  //   );
  // }

  static IconThemeData get iconTheme {
    return const IconThemeData(
      color: AppColors.blue,
      size: 24,
    );
  }

  static ProgressIndicatorThemeData get progressIndicatorTheme {
    return const ProgressIndicatorThemeData(color: AppColors.blue);
  }

  static const IconData lockIcon = Icons.lock;
  static const IconData unlockIcon = Icons.lock_open_outlined;
  static const IconData doneIcon = Icons.check;
  static const IconData makeTestIcon = Icons.play_circle_outline;
  static const IconData stopTestIcon = Icons.stop_circle_outlined;
  static const IconData correctIcon = Icons.check;
  static const IconData wrongIcon = Icons.close;
  static const IconData blankIcon = Icons.circle_outlined;

  static const IconData medalIcon = Icons.workspace_premium_sharp;
  static const IconData bestTopicIcon = Icons.trending_up_rounded;
  static const IconData worstTopicIcon = Icons.warning_amber_rounded;

  // Comparison
  static const IconData compareEquals = Icons.compare_arrows;
  static const IconData compareLess = Icons.arrow_downward;
  static const IconData compareMore = Icons.arrow_upward;
}
