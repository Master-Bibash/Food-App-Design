import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboard.dart';
import 'package:flutter_application_1/widget/app_constants.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey=publishableKey;
  
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB1a0i5wGwLhAhi-daeZRWkyDvQEAdhhwc",
        appId: "1:315720210703:android:12af177103bb3ec7eec67a",
        messagingSenderId: "315720210703",
        projectId: "project-ecommerce-7ee17",
        storageBucket: 'gs://project-ecommerce-7ee17.appspot.com/blogImages',

      ),
    );
    print("Firebase initialized");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const onBoard(),
    );
  }
}

