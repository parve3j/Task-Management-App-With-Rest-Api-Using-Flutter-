import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/controller/auth_controller.dart';
import 'package:task_management/ui/screens/forgot_password_screen.dart';
import 'package:task_management/ui/screens/login_screen.dart';
import 'package:task_management/ui/screens/main_bottom_nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    gotLogin();
    super.initState();
  }
  Future<void> gotLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token= sharedPreferences.getString('token');
    // final bool isLogin= await AuthController.checkAuthStatus();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
      token==null? LoginScreen(): MainBottomNavScreen()), (route) => false)
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/background.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SvgPicture.asset("assets/images/logo.svg"),
          )
        ],
      ),
    );
  }
}
