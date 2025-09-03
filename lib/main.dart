import 'package:alqasim_market/BloC/app_bloc.dart';
import 'package:alqasim_market/BloC/auth_bloc.dart';
import 'package:alqasim_market/BloC/search_bloc.dart';
import 'package:alqasim_market/network/local/cache_helper.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/utilites/bloc_observes.dart';
import 'package:alqasim_market/utilites/routers/routes.dart';
import 'package:alqasim_market/views/pages/authentication_page.dart';
import 'package:alqasim_market/views/pages/landing_page.dart';
import 'package:alqasim_market/views/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();

  bool isauth = CacheHelper.getData('isauth') ?? false;
  bool islanding = CacheHelper.getData('islanding') ?? false;

  runApp(MyApp(isauth: isauth, islanding: islanding));
}

class MyApp extends StatelessWidget {
  final bool isauth;
  final bool islanding;

  const MyApp({super.key, required this.isauth, required this.islanding});

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;

    if (isauth) {
      initialScreen = MainPage();
    } else if (!isauth) {
      initialScreen = AuthenticationPage();
    } else {
      initialScreen = LandingPage();
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
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
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2.0),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),

        onGenerateRoute: AppRouter.generateRoute,
        home: initialScreen,
      ),
    );
  }
}
