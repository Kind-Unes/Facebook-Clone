import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/text_input.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/date_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class JoinFacebookFifth extends StatelessWidget {
  const JoinFacebookFifth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final datePickerProvider =
        Provider.of<DatePickerProvider>(context, listen: true);

    TextEditingController controller = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(datePickerProvider.selectedDate),
    );

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
                "What's your birthday?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "choose your date of birth. You can hide this from your profile later.",
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
                  readOnly: true,
                  controller: controller,
                  onTap: () => datePickerProvider.pickDate(context),
                  visible: false,
                  warningText: "",
                  width: 179,
                  text: "Birthday",
                  onChanged: (String newText) {},
                ),
              ),
              Transform.translate(
                offset: const Offset(-105, -38),
                child: Text(
                  controller.text,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              Visibility(
                visible: datePickerProvider.showDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Text(
                    "Please enter a valid birhday",
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
                    if (datePickerProvider.validateDate()) {
                      datePickerProvider.setDateValidation(false);
                      // we Route
                      context.goNamed("Gender");
                    } else {
                      // Date is not valid
                      datePickerProvider.setDateValidation(true);
                    }
                  }),
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
