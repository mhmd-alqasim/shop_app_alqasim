import 'package:alqasim_market/views/pages/authentication_page.dart';
import 'package:alqasim_market/views/pages/home_page.dart';
import 'package:alqasim_market/views/pages/landing_page.dart';
import 'package:alqasim_market/views/pages/main_page.dart';
import 'package:alqasim_market/views/pages/product_page.dart';
import 'package:alqasim_market/views/pages/search_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String landingPageRoute = '/landing';
  static const String authPageRoute = '/auth';
  static const String mainPageRoute = '/main';
  static const String homePageRoute = '/home';
  static const String searchPageRoute = '/search';
  static const String categorePageRoute = '/categore';
  static const String productPageRoute = '/product';

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
      case productPageRoute:
        // التحقق من وجود الـ arguments وأنها من نوع int
        final id = settings.arguments as int?;
        if (id != null) {
          // إذا كان الـ id موجودًا، نمرره إلى ProductPage
          return MaterialPageRoute(builder: (_) => ProductPage(id: id));
        } else {
          // في حالة عدم وجود الـ id أو أنه من نوع خاطئ
          return MaterialPageRoute(
            builder:
                (_) => Scaffold(
                  body: Center(child: Text('Error: Product ID is missing!')),
                ),
          );
        }

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
