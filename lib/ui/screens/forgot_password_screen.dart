import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/pin_verification_screen.dart';
import 'package:task_management/ui/screens/signup_screen.dart';

import '../widgets/background_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                  Text('Your Email Address',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('A six digit Otp will send to your email',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>pinverification_screen() ));
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined)
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
