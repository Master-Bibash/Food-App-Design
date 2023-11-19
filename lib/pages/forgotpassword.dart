import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailController = TextEditingController();
  String email = '';
  final _formKey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password sent to email")));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that email",
          style: TextStyle(fontSize: 18),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: SizedBox(
              height: 150,
            ),
          ),
          Container(
            child: Text(
              "Password Recovery",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Enter your mail",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white70, width: 2)),
                    padding: EdgeInsets.only(),
                    child: TextFormField(
                      controller: mailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter email";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email=mailController.text;
                            });
                            resetPassword();
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.90,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            "Send Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => login(),
                              ));
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: Color.fromARGB(225, 184, 166, 6),
                              fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
