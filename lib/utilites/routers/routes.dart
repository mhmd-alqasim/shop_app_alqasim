import 'package:alqasim_market/views/pages/authentication_page.dart';
import 'package:alqasim_market/views/pages/home_page.dart';
import 'package:alqasim_market/views/pages/landing_page.dart';
import 'package:alqasim_market/views/pages/main_page.dart';
import 'package:alqasim_market/views/pages/search_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String landingPageRoute = '/landing';
  static const String authPageRoute = '/auth';
  static const String mainPageRoute = '/main';
  static const String homePageRoute = '/home';
  static const String searchPageRoute = '/search';
  static const String categore = '/categore';
  static const String productDetails = '/productDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPageRoute:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case authPageRoute:
        return MaterialPageRoute(builder: (_) => AuthenticationPage());
      case mainPageRoute:
        return MaterialPageRoute(builder: (_) => MainPage());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case searchPageRoute:
        return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(body: Center(child: Text('page is not found'))),
        );
    }
  }
}
