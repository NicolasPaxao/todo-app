import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_dependency.dart';

import 'app_myapp.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.init();
  runApp(const MyApp());
}
