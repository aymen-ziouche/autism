import 'package:flutter/material.dart';
import 'package:xpert_autism/features/patient/presentation/pages/add_patient_screen.dart';
import 'package:xpert_autism/screens/home_screen.dart';
import 'package:xpert_autism/screens/splash_screen.dart';

class CustomRouter {
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String addPatientScreen = '/add';
  static const String neutralScreen = '/neutralScreen';
  static const String smilingScreen = '/smile';
  static const String sadScreen = '/sad';

  const CustomRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const SplashScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),
        );
      case addPatientScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddPatientScreen(),
        );

      default:
        throw Exception('Route not found!');
    }
  }
}
