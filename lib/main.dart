import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xpert_autism/app.dart';
import 'package:xpert_autism/injectable.dart';
import 'package:xpert_autism/locator.dart';

void main() async {
  // Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configInjections();
  await setupLocator();
  runApp(const App());
}
