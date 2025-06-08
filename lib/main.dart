import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:porter_clone/feature/screens/LoginScreens/Signin_screen.dart';
import 'package:porter_clone/feature/screens/BottomNav/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: isLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.data == true) {
              print("sdss");
              return MainScreen(); // If logged in, go to MainScreen
            } else {
              return SigninScreen(); // If not logged in, go to SigninScreen
            }
          }
        },
      ),
    );
  }
}
