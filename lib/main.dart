import 'package:alqasim_market/BloC/app_bloc.dart';
import 'package:alqasim_market/BloC/auth_bloc.dart';
import 'package:alqasim_market/BloC/search_bloc.dart';
import 'package:alqasim_market/network/local/cache_helper.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/theme/app_theme.dart' show AppTheme;
import 'package:alqasim_market/utilites/bloc_observes.dart';
import 'package:alqasim_market/utilites/routers/routes.dart';
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
    String initialRoute;
    if (isauth) {
      initialRoute = AppRouter.mainPageRoute;
    } else if (!isauth) {
      initialRoute = AppRouter.authPageRoute;
    } else {
      initialRoute = AppRouter.landingPageRoute;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: initialRoute,
        // Keep `onGenerateRoute` to handle all other routes.
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
