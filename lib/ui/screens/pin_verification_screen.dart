import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/ui/screens/reset_password.dart';
import 'package:task_management/ui/screens/signup_screen.dart';

import '../widgets/background_widget.dart';

class pinverification_screen extends StatefulWidget {
  const pinverification_screen({super.key});

  @override
  State<pinverification_screen> createState() => _pinverification_screenState();
}

class _pinverification_screenState extends State<pinverification_screen> {
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
                  Text('Pin verification',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(
                    height: 8,
                  ),
                  Text('A six digit Otp will send to your email',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 24,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    obscuringWidget: const FlutterLogo(
                      size: 24,
                    ),
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.green,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    // controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        // currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
                        },
                        child: const Text('Verifid')
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
