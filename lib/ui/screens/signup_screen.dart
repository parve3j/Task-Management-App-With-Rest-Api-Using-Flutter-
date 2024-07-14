import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/data/network_caller.dart';
import 'package:task_management/ui/widgets/snack_message.dart';

import '../../data/newwork_response.dart';
import '../../data/utility/urls.dart';
import '../widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailControler= TextEditingController();
  final TextEditingController _firstNameControler= TextEditingController();
  final TextEditingController _lastNameControler= TextEditingController();
  final TextEditingController _mobileControler= TextEditingController();
  final TextEditingController _passwordControler= TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  bool _signUpInprogress= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BakcgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    Text('Join with us',
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _emailControler,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _firstNameControler,
                      decoration: const InputDecoration(hintText: 'First Name'),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter a First Name";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _lastNameControler,
                      decoration: const InputDecoration(hintText: 'Last Name'),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter a last name";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _mobileControler,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter a valid mobile number";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordControler,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "This field can't be empty";
                        }
                        return null;
                      },

                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: _signUpInprogress==false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: _signUp,
                            child: const Icon(Icons.arrow_circle_right_outlined)
                        ),
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
      ),
    );
  }
  Future<void> _signUp()async{
    if(_formKey.currentState!.validate()){
      if(mounted){
        setState(() {
          _signUpInprogress= true;
        });
      }
      final NetworkResponse? rsponse = await NetworkCaller().postRequest(Urls.registration, body:{
        "email":_emailControler.text.trim(),
        "firstName":_firstNameControler.text.trim(),
        "lastName":_lastNameControler.text.trim(),
        "mobile":_mobileControler.text.trim(),
        "password":_passwordControler.text.trim()
      });
      setState(() {
        _signUpInprogress= false;
      });
      if(rsponse!.isSuccess){
        _clearTextFields();
        if(mounted){
          showMessage(context, 'Success');
        }
      }
    }else{
      final NetworkResponse? rsponse = await NetworkCaller().postRequest(Urls.registration);
      if(rsponse!.isSuccess){
        if(mounted){
          showMessage(context, 'Failed');
        }
      }
    }
  }
  void _clearTextFields(){
    _emailControler.clear();
    _firstNameControler.clear();
    _lastNameControler.clear();
    _emailControler.clear();
    _mobileControler.clear();
    _passwordControler.clear();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailControler.dispose();
    _firstNameControler.dispose();
    _lastNameControler.dispose();
    _emailControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }
}
