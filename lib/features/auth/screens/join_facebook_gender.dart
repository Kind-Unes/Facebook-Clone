import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/informations_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class JoinFacebookSixth extends StatelessWidget {
  const JoinFacebookSixth({
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
                "What's your gender?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You change who sees your gneder on your profile later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              RadioListTile<String>(
                title: const Text(
                  'Male',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Male",
                groupValue: myProvider.selectedGender,
                onChanged: (value) => myProvider.setGender(value!),
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              RadioListTile<String>(
                title: const Text(
                  'Female',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Female",
                groupValue: myProvider.selectedGender,
                onChanged: (value) => myProvider.setGender(value!),
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              RadioListTile<String>(
                subtitle: const Text(
                  "Select this if you are a GAY, or if you'd rather not to say.",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                title: const Text(
                  'Gay',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Custom",
                groupValue: myProvider.selectedGender,
                onChanged: (value) => myProvider.setGender(value!),
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              MyDefaultButton(
                buttonColor: MyColors.primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                text: "Next",
                onClicked: () {
                  print(myProvider.selectedGender);
                  context.goNamed("Password");
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
// Column(
//       children: <Widget>[
//         
//         RadioListTile<Gender>(
//           title: Text('Female'),
//           value: Gender.Female,
//           groupValue: genderProvider.selectedGender,
//           onChanged: (value) => genderProvider.setGender(value),
//         ),
//         RadioListTile<Gender>(
//           title: Text('Custom'),
//           value: Gender.Custom,
//           groupValue: genderProvider.selectedGender,
//           onChanged: (value) => genderProvider.setGender(value),
//         ),
//       ],
//     );