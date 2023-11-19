import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottomNavigation.dart';
import 'package:flutter_application_1/pages/forgotpassword.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/widget_support.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String email = '', password = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "NO user found",
          style: TextStyle(fontSize: 18, color: Colors.black),
        )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Wrong password",
          style: TextStyle(fontSize: 18, color: Colors.black),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height / 2.5,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ])),
              ),
              Container(
                width: size.width / 1.3,
                margin: const EdgeInsets.only(top: 60, left: 70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      12), // Adjust the radius as per your preference
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 1.6,
                      child: Material(
                        elevation: 7,
                        borderRadius: BorderRadius.circular(
                            12), // Same radius as the outer BoxDecoration
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text("Login",
                                    style: AppWidget.headerTextFieldStyle()),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill the data';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please fill the data';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon:
                                        const Icon(Icons.password_outlined),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPassword(),
                                        ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 60),
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      "Forgot Password?",
                                      style: AppWidget.semiBoldTextFieldStyle(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2,
                                  height: size.height * 0.06,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            email = emailController.text;
                                            password = passwordController.text;
                                          });
                                        }
                                        userLogin();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffff5722)),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Poppins1',
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            // width: size.width / 2,
            height: size.height * 0.04,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ));
            },
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account?SignUp",
                      style: AppWidget.semiBoldTextFieldStyle())
                ])),
          )
        ],
      ),
    );
  }
}
