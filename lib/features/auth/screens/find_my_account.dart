import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FindMyAccount extends StatelessWidget {
  const FindMyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Facebook',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Find Your Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your phone number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 35,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextField(
                  controller: TextEditingController(text: "+213 55452418"),
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyDefaultButton(
                      buttonColor: const Color.fromARGB(255, 188, 188, 188),
                      textColor: Colors.black,
                      width: 183,
                      text: "Cancel",
                      onClicked: () {
                        context.go("/");
                      }),
                  MyDefaultButton(
                      buttonColor: MyColors.primaryColor,
                      textColor: const Color.fromARGB(255, 255, 255, 255),
                      width: 183,
                      text: "Search",
                      onClicked: () {}),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: LinkText(
                    onTap: () {}, text: "Search by your eamil or name instead"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
