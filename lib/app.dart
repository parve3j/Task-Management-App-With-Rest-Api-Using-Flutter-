import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
        ),
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12)
          )
        )
      ),
    );
  }
}
