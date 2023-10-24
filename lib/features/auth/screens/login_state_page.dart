import 'package:facebook_clone_app/features/auth/screens/main_auth.dart';
import 'package:facebook_clone_app/features/home/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    onRefresh(FirebaseAuth.instance.currentUser);
  }

  void onRefresh(userCredential) {
    setState(() {
      user = userCredential;
    });
  }

  @override
  Widget build(BuildContext context) {
    return user == null ? const MainAutth() : const Home();
  }
}


  // return StreamBuilder<User?>(
  //     stream: FirebaseAuth.instance.authStateChanges(),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         // Loading state
  //         return const CircularProgressIndicator();
  //       } else if (snapshot.hasData && snapshot.data != null) {
  //         // User is logged in
  //         return const Home();
  //       } else {
  //         // User is not logged in
  //         return const MainAutth();
  //       }
  //     },
  //   );