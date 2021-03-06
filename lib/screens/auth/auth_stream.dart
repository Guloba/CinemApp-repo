import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinemapp/screens/landing_screen.dart';

import '../main_screen.dart';
import 'package:universal_io/io.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return MainScreen();
          } else {
            return LandingScreen();
          }
        } else if (snapshot.hasError) {
          return Text('Error Occured');
        }
        return LandingScreen();
      },
    );
  }
}