import 'package:flutter/material.dart';
import 'package:main_character/app/app.dart';
import 'package:main_character/app/di/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MainCharacterApp());
}
