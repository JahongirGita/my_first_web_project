import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_first_web_project/dashboard_screen.dart';
import 'package:my_first_web_project/utils/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  padding: EdgeInsets.all(24),
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.purple],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.business, color: Colors.white, size: 32),
                      ),
                        SizedBox(height: 16,),
                        Text("Xush kelibsiz",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                        Spacer(),
                        LoginTextField(controller: _loginController, hintText: "E-Mail", icon: Icons.person_outline),
                        SizedBox(height: 16,),
                        LoginTextField(controller: _passwordController,hintText: "Password", icon: Icons.lock_outline),
                      Spacer(),
                        GestureDetector(
                          onTap: (){
                            if(_loginController.text=='admin' && _passwordController.text == 'admin'){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
                            }
                          },
                          child: Container(width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(colors: [
                              Color(0xFF5078FF),
                              Color(0xFF5078FF),
                            ]),
                          ),
                          child: Center(child: Text("Tizimga kirish",style: TextStyle(fontSize: 16,color: Colors.white),)),),
                        )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
