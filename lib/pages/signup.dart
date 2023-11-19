import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bottomNavigation.dart';
import 'package:flutter_application_1/pages/forgotpassword.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/service/database.dart';
import 'package:flutter_application_1/service/shared_prefrences.dart';
import 'package:flutter_application_1/widget/widget_support.dart';
import 'package:random_string/random_string.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  registration() async {
    try {
      if (email != null && password != null) {
        // Attempt to create a user with email and password
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        // Show success message and navigate to the login page
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Registration success!",
            style: TextStyle(fontSize: 20),
          ),
        ));
        String id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "Name": nameController.text, // Fixed typo here (namecontroller to nameController)
          "Email": emailController.text, // Fixed typo here (mailcontroller to emailController)
          "Wallet": "0",
          "Id": id, // Use the id variable instead of randomAlphaNumeric(10)
        };
        await DatabaseMethods().addUserDetail(addUserInfo, id);
        await SharedPreferenceHelper().saveUserName(nameController.text);
        await SharedPreferenceHelper().saveUserEmail(emailController.text);
        await SharedPreferenceHelper().saveUserWallet('0');
        await SharedPreferenceHelper().saveUserId(id);

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      }
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password Provided is too Weak",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Account Already exists",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
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
                height: size.height / 2.3,
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 1.4,
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(
                              12), // Same radius as the outer BoxDecoration
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text("SignUp",
                                    style: AppWidget.headerTextFieldStyle()),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter name here";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon:
                                        const Icon(Icons.person_outline),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter email here";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle:
                                        AppWidget.semiBoldTextFieldStyle(),
                                    prefixIcon: const Icon(Icons.mail_outline),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.05,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the value';
                                    }
                                    return null;
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
                                            name = nameController.text;
                                            password = passwordController.text;
                                          });
                                        }
                                        registration();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffff5722)),
                                      child: const Text(
                                        "SignUp",
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
                    ],
                  ),
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
                    builder: (context) => const login(),
                  ));
            },
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account?Login",
                      style: AppWidget.semiBoldTextFieldStyle())
                ])),
          )
        ],
      ),
    );
  }
}
