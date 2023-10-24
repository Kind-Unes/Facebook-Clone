import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  final String picture;
  final int stroiesNumber;
  final String firstName;
  final String lastName;
  const Story({
    super.key,
    required this.picture,
    required this.stroiesNumber,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          print("Story tapped!");
        },
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(picture, fit: BoxFit.fill),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.1)
                      ],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 5,
                  left: 10,
                  child: Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      stroiesNumber.toString(),
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
              Positioned(
                  top: 135,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        firstName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        lastName,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
