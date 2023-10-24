import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookThird extends StatefulWidget {
  const JoinFacebookThird({
    super.key,
  });

  @override
  State<JoinFacebookThird> createState() => _JoinFacebookThirdState();
}

class _JoinFacebookThirdState extends State<JoinFacebookThird> {
  @override
  Widget build(BuildContext context) {
    const String message = "Please provide a valid email adress";

    final emailValidationProvider =
        Provider.of<InformationsProvider>(context, listen: true);

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
                "Enter your email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter the email where you can be reached. You can hide this from your profile later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: MyTextInput(
                  obscureText: false,
                  onTap: () {},
                  readOnly: false,
                  controller: TextEditingController(),
                  visible: false,
                  warningText: "",
                  width: 179,
                  text: "Email address",
                  onChanged: (String newText) {
                    emailValidationProvider.setEmail(newText);
                  },
                ),
              ),
              Visibility(
                visible: emailValidationProvider.showMail,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Text(
                    message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyDefaultButton(
                  buttonColor: MyColors.primaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                  text: "Next",
                  onClicked: () {
                    Provider.of<InformationsProvider>(context, listen: false)
                        .isEmailValid();

                    if (!Provider.of<InformationsProvider>(context,
                            listen: false)
                        .showMail) {
                      context.goNamed("Birthday");
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              MyDefaultButton(
                onClicked: () {
                  context.replaceNamed("Mobile");
                },
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Sign up with phone number",
              ),
              const Spacer(
                flex: 15,
              ),
              MyDefaultButton(
                onClicked: () {},
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Already have an account?",
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
