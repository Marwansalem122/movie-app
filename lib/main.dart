import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          routes: {
            'splashview': (context) => const SplashPage(),
            'main': (context) => MainPage(),
          },
          initialRoute: 'splashview',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              useMaterial3: true,
              primarySwatch: Colors.blue),
          home: const SplashPage(),
        );
      },
    );
  }
}
