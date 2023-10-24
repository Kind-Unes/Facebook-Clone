import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/authentication_service.dart';
import 'package:facebook_clone_app/features/auth/controllers/login_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<LoginInProvider>(context, listen: false);

    Future signInWithEmailAndPassword() async {
      myProvider.setShowError(false);
      myProvider.setError("");

      final result = await AuthService(
              auth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance)
          .signInWithEmailAndPassword(myProvider.email, myProvider.password);

      result.fold((l) {
        myProvider.setError(l.message);
        myProvider.setShowError(true);
      }, (r) {
        context.goNamed("Home");
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Facebook",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          toolbarHeight: 40,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextInput(
                  width: double.infinity,
                  text: "Mobile number or email",
                  onChanged: (String text) {
                    Provider.of<LoginInProvider>(context, listen: false)
                        .setEmail(text);
                  },
                  warningText: "",
                  visible: false,
                  controller: TextEditingController(),
                  onTap: () {},
                  readOnly: false,
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextInput(
                  width: double.infinity,
                  text: "Password",
                  onChanged: (String text) {
                    Provider.of<LoginInProvider>(context, listen: false)
                        .setPassword(text);
                  },
                  warningText: myProvider.error,
                  visible: Provider.of<LoginInProvider>(context, listen: true)
                      .showError,
                  controller: TextEditingController(),
                  onTap: () {},
                  readOnly: false,
                  obscureText: true),
              const SizedBox(
                height: 5,
              ),
              MyDefaultButton(
                  buttonColor: const Color.fromARGB(220, 14, 92, 227),
                  textColor: Colors.white,
                  width: double.infinity,
                  text: "Log in",
                  onClicked: () {
                    signInWithEmailAndPassword();
                  }),
              const SizedBox(
                height: 10,
              ),
              LinkText(
                text: "Forgot password?",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDivider(
                    height: 1,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "or",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyDivider(
                    height: 1,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: MyDefaultButton(
                    buttonColor: MyColors.activeStatus,
                    textColor: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: "Create new account",
                    onClicked: () {}),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinkText(onTap: () {}, text: "Francais (France)"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "العربية"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "English (US)"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "More Languages . . . "),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}

class MyDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  const MyDivider({
    super.key,
    required this.height,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color),
    );
  }
}

class LinkText extends StatelessWidget {
  final Function() onTap;
  final String text;
  const LinkText({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 33, 103, 243), fontSize: 19),
      ),
    );
  }
}
