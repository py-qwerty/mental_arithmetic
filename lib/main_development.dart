

import 'package:device_preview/device_preview.dart';
import 'package:mental_arithmetic/app/app.dart';
import 'package:mental_arithmetic/bootstrap.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'config/environment.dart';


void main() async {
  await bootstrap(BuildVariant.development, () => Phoenix(
    child: DevicePreview(
      enabled: true,
      builder:(context) => const App(),
      ),
    ),
  );
}
