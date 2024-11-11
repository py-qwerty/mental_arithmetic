import 'package:flutter/cupertino.dart';
import 'package:mental_arithmetic/bootstrap.dart';
import 'app/app.dart';
import 'config/environment.dart';

void main() async {
  await bootstrap(BuildVariant.production, () => const App());
}
