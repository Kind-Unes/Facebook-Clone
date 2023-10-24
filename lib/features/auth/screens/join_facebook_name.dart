import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookSecond extends StatelessWidget {
  const JoinFacebookSecond({super.key});

  @override
  Widget build(BuildContext context) {
    final showVerificationProvider = Provider.of<InformationsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text(
            "Join Facebook",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "What's your name?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter the name you use in real life.",
              style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75), fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextInput(
                      obscureText: false,
                      onTap: () {},
                      readOnly: false,
                      controller: TextEditingController(),
                      visible: showVerificationProvider.showFirst,
                      warningText: "Please enter your first name",
                      width: 179,
                      text: "First name",
                      onChanged: (String newText) {
                        Provider.of<InformationsProvider>(context,
                                listen: false)
                            .setFirstName(newText);
                      },
                    ),
                    MyTextInput(
                      obscureText: false,
                      onTap: () {},
                      readOnly: false,
                      controller: TextEditingController(),
                      visible: showVerificationProvider.showLast,
                      warningText: "Please enter your last name",
                      width: 179,
                      text: "Last name",
                      onChanged: (String newText) {
                        Provider.of<InformationsProvider>(context,
                                listen: false)
                            .setLastName(newText);
                      },
                    ),
                  ]),
            ),
            Visibility(
              visible: showVerificationProvider.showBoth,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: const BoxDecoration(color: Colors.red),
                child: const Text(
                  "Please enter your first and last name.",
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
                  final firstName =
                      context.read<InformationsProvider>().firstName;
                  final lastName =
                      context.read<InformationsProvider>().lastName;
                  if ((firstName.isEmpty & lastName.isEmpty) == true) {
                    showVerificationProvider.setFirstNameVerification(false);
                    showVerificationProvider.setLastNameVerification(false);
                    showVerificationProvider.setBothVerification(true);
                  } else {
                    showVerificationProvider.setBothVerification(false);

                    if (firstName.isEmpty) {
                      showVerificationProvider.setFirstNameVerification(true);
                      //dont route
                    } else {
                      showVerificationProvider.setFirstNameVerification(false);
                    }

                    if (lastName.isEmpty) {
                      showVerificationProvider.setLastNameVerification(true);
                      //dont route
                    } else {
                      showVerificationProvider.setLastNameVerification(false);
                    }

                    if ((firstName.isEmpty || lastName.isEmpty) == false) {
                      print('First Name: $firstName, Last Name: $lastName');
                      //we route
                      (context).goNamed("Email");
                    }
                  }
                }),
            const Spacer(
              flex: 15,
            ),
            MyDefaultButton(
                onClicked: () {},
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Already have an account?"),
            const Spacer(
              flex: 1,
            ),
          ]),
        ),
      ),
    );
  }
}
