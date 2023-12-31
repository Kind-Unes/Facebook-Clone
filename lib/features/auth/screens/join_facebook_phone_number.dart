import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookFourth extends StatelessWidget {
  const JoinFacebookFourth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<InformationsProvider>(context);

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
                "Enter your mobile number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter the mobile number where you can be reached. You can hide this from your profile later.",
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
                  text: "Mobile number",
                  onChanged: (String newText) {
                    myProvider.setPhoneNumber(newText);
                  },
                ),
              ),
              Visibility(
                visible: myProvider.showPhoneNumber,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Text(
                    "Please enter a valid mobile number",
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
                  myProvider.isPhoneValid();
                  if (!myProvider.showPhoneNumber) {
                    // Proceed with the routing logic
                    context.goNamed("Birthday");
                  } else {
                    // Handle the case when the email is not valid
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MyDefaultButton(
                onClicked: () {
                  context.replaceNamed("Email");
                },
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Sign up with email",
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
