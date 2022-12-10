import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_dependency.dart';
import 'app_myapp.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.init();
  runApp(const MyApp());
}
