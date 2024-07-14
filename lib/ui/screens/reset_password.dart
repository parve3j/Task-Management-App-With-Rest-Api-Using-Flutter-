import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/login_screen.dart';
import 'package:task_management/ui/screens/pin_verification_screen.dart';
import 'package:task_management/ui/screens/signup_screen.dart';

import '../widgets/background_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BakcgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text('Set Password',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('Minumum password length should be more than 8 letters',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Confirm password',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                        },
                        child: const Text('Confirm')
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      const Text('Have an account?'),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text('Sign In', style: TextStyle(
                            color: Colors.green
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
