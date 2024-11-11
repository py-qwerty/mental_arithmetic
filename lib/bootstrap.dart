import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/environment.dart';

Future<void> bootstrap(
    BuildVariant variant,
    FutureOr<Widget> Function() builder,
    ) async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the environment with the specified build variant
  Environment.init(variant);

  // Lock the app to portrait mode (optional)
  unawaited(
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]),
  );

  // Start the Flutter application
  runApp(await builder());
}
