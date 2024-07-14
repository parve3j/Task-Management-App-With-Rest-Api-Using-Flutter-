import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/controller/auth_controller.dart';
import 'package:task_management/data/model/user_model.dart';
import 'package:task_management/data/network_caller.dart';
import 'package:task_management/data/newwork_response.dart';
import 'package:task_management/ui/screens/forgot_password_screen.dart';
import 'package:task_management/ui/screens/signup_screen.dart';
import 'package:task_management/ui/widgets/snack_message.dart';

import '../../data/utility/urls.dart';
import '../widgets/background_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final GlobalKey<FormState> _globalKey= GlobalKey<FormState>();
  bool _loginInprogress= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BakcgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Text('Get Started with',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (String? value){
                        if(value!.trim().isEmpty==true){
                          return "This field can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (String? value){
                        if(value!.isEmpty){
                          return "This field can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _loginInprogress==false,
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: login,
                          child: const Icon(Icons.arrow_circle_right_outlined)
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                        },
                        child: const Text('Forgot password'),
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                          },
                          child: const Text('Sign up', style: TextStyle(
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
      ),
    );
  }

  Future<void> login() async{
    if(!_globalKey.currentState!.validate()){
      return;
    }
    if(mounted){
      setState(() {
        _loginInprogress=true;
      });
    }
    NetworkResponse? response= await NetworkCaller().postRequest(Urls.login, body: {
      "email":_emailController.text.trim(),
      "password":_passwordController.text
    });
    if(mounted){
      setState(() {
        _loginInprogress=false;
      });
    }
    if(response!.isSuccess){
      await AuthController.saveUserInformation(response.jsonResponse!['token'], UserModel.fromJson(response.jsonResponse!['data']));
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.jsonResponse!['token']);
      if(mounted){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
      }
    }else{
      if(mounted){
        showMessage(context,response.errorMessage.toString());
      }
    }
}
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
