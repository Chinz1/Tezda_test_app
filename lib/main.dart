import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tezda_app/auth/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda_app/controller/auth_controller.dart';
import 'package:tezda_app/controller/login.dart';
import 'package:tezda_app/controller/signup.dart';
import 'package:tezda_app/controller/user.dart';


late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  Get.put(UserController());
  Get.put(LoginController());
  Get.put(SignupController());
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final AuthRepository _authRepository = AuthRepository();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              useMaterial3: true,
              fontFamily: "SF-Pro",
            ),
            home: SplashScreen(),
            // navigatorKey: AppRouter.router.navigatorKey,
            // initialRoute: SplashScreen.routeName,
            // home: BlocProvider(
            //   create: (context) => AuthBloc(),
            // child: const SignUpScreen(),
          ),
        );
  }
}
