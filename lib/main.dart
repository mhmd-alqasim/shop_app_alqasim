import 'package:alqasim_market/utilites/routers/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFe5e5e5),
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        fontFamily: 'Cairo',
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.titleSmall,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),

      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.authPageRoute,
    );
  }
}
