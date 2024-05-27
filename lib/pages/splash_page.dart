import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/common/utils/size_config.dart';
import 'package:movie_app/model/app_config.dart';
import 'package:movie_app/pages/main_page.dart';
import 'package:movie_app/services/http_services.dart';
import 'package:movie_app/services/movie_services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setup(context).then((value) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainPage()),
            (route) => false);
      });
    });
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = jsonDecode(configFile);
    getIt.registerSingleton<AppConfig>(AppConfig(
        API_KEY: configData["API_KEY"],
        BASE_API_URL: configData["BASE_API_URL"],
        BASE_IMAGE_API_URL: configData["BASE_IMAGE_API_URL"]));
    getIt.registerSingleton<HttpServices>(HttpServices());
    getIt.registerSingleton<MovieServices>(MovieServices());
  
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        width: 200.w,
        height: 200.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.contain)),
      ),
    );
  }
}
