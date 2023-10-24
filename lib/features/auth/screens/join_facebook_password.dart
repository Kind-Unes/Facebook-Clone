import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookSeventh extends StatelessWidget {
  const JoinFacebookSeventh({
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
                "Create a password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create a password with at least 6 characters. It should be somthing others couldn't guess.",
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
                  onTap: () {},
                  obscureText: false,
                  readOnly: false,
                  controller: TextEditingController(),
                  visible: false,
                  warningText: "",
                  width: 179,
                  text: "New Password",
                  onChanged: (String newText) {
                    myProvider.setPassword(newText);
                  },
                ),
              ),
              Visibility(
                visible: !myProvider.isPasswordValid,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Text(
                    "This password is too short. Create a longer password with at least 6 letters and numbers.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
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
                  {
                    myProvider.validatePassword(myProvider.password);
                    myProvider.isPasswordValid
                        ? context.goNamed("Finish")
                        : null;
                  }
                },
              ),
              const SizedBox(
                height: 10,
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
