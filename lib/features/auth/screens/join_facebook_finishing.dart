import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/authentication_service.dart';
import 'package:facebook_clone_app/features/auth/controllers/data_model_provider.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookLast extends StatelessWidget {
  const JoinFacebookLast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<InformationsProvider>(context);
    final myDataProvider = Provider.of<DataModelProvider>(context);

    Future createUserWithEmailAndPassowrd() async {
      final result = await AuthService(
              auth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance)
          .createUserWithEmailAndPassword(
              myProvider.email,
              myProvider.password,
              myProvider.firstName,
              myProvider.lastName,
              "assets/images/default_picture.jpg",
              myProvider.selectedGender);

      result.fold((l) {
        //
      }, (r) {
        myDataProvider.setDataModel(r);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Join Facebook",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Finish signing up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "People who use our service may have uploaded your contact information to Facebook. Learn more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 75, 75, 75),
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "By tapping Sign Up,you agree to our Terms Privacy Policy and Cokkies Policy. You may",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 75, 75, 75),
                    fontSize: 17,
                  ),
                ),
              ),
              const Text(
                " receive SMS notifications from us and can opt out any time.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyDefaultButton(
                buttonColor: MyColors.primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                text: "Sign Up",
                onClicked: () {
                  createUserWithEmailAndPassowrd();
                  context.pushReplacementNamed("Home");
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
