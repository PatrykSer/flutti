import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutti/ViewScreen/authonerScreen.dart';
import 'package:flutti/ViewScreen/chat.dart';
import 'package:flutti/ViewScreen/Splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.amber,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged, builder: (ctx, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
        if (userSnapshot.hasData) {
          return ChatScreen();
        }
        return AuthScreen();
      }),
    );
  }
}
