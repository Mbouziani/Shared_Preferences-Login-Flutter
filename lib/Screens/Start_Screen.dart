// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:demo_shared_preferences/Screens/Home.Screen.dart';
import 'package:demo_shared_preferences/Screens/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StratScreen extends StatefulWidget {
  const StratScreen({Key? key}) : super(key: key);

  @override
  State<StratScreen> createState() => _StratScreenState();
}

class _StratScreenState extends State<StratScreen> {
  @override
  void initState() {
    CheckingSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Start Screen"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            'Start',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26),
          ),
        ),
      ),
    );
  }

  CheckingSavedData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefe = await SharedPreferences.getInstance();

      if (prefe.containsKey('Emaildata')) {
        Get.off(const HomeScreen());
      } else {
        Get.off(LoginScreen());
      }
    });
  }
}
