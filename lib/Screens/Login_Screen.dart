// ignore_for_file: non_constant_identifier_names, prefer_final_fields, must_be_immutable

import 'package:demo_shared_preferences/Screens/Home.Screen.dart';
import 'package:demo_shared_preferences/widgets/TextField_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Login Screen"),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  ValdatorText: 'Emeil Field is empty !!',
                  controller: _Emailcontroller,
                  hintText: 'Email',
                  onChange: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  ValdatorText: 'Password Field is empty !!',
                  controller: _Passwordcontroller,
                  hintText: 'Password',
                  onChange: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setString('Emaildata', _Emailcontroller.text);
                          Get.off(() => const HomeScreen());
                        }
                      },
                      color: Colors.red,
                      elevation: 0.0,
                      highlightElevation: 0.5,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
