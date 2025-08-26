import 'package:alqasim_market/views/pages/authentication_page.dart';
import 'package:alqasim_market/views/pages/landing_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String landingPageRoute = '/landing';
  static const String authPageRoute = '/auth';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPageRoute:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case authPageRoute:
        return MaterialPageRoute(builder: (_) => AuthenticationPage());
      default:
        return MaterialPageRoute(builder: (_) => LandingPage());
    }
  }
}
