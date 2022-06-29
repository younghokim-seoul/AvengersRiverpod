import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_sample/resources/resources.dart';
import 'package:riverpod_sample/route/app_route.dart';

const seedColor = Color(0xff00ffff);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor,
              primary: AppColors.primary_400,
              primaryContainer: AppColors.primary_600,
              secondary: AppColors.secondary_500,
              background: Colors.white,
              brightness: Brightness.dark),
          textTheme:
              GoogleFonts.notoSansNKoTextTheme(Theme.of(context).textTheme),
          appBarTheme: const AppBarTheme(
              toolbarHeight: 56,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -0.16,
              ))),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
