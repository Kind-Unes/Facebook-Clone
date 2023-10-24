import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_app/core/components/user_profile_widgets.dart';
import 'package:facebook_clone_app/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            "My Profile",
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Your profiles",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ]),
      body: StreamBuilder<UserModel?>(
          stream: readUser(FirebaseAuth.instance.currentUser!
              .uid), // Provide the specific user's ID here
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              return SingleChildScrollView(
                  child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //

                      Material(
                        color: Colors.red,
                        child: InkWell(
                          onTap: () {
                            // BACKGROUND PICTURE CHANGE LOGIC
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Container(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user.firstName} ${user.lastName}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // Buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProfileButton(
                                    onTap: () {},
                                    text: ' Add to story',
                                    icon: Icons.add,
                                    color:
                                        const Color.fromARGB(255, 27, 95, 243),
                                    textColor: Colors.white,
                                  ),
                                  ProfileButton(
                                    onTap: () {},
                                    text: ' Edit profile',
                                    icon: Icons.edit,
                                    color: const Color.fromARGB(
                                        255, 199, 199, 199),
                                    textColor: Colors.black,
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color.fromARGB(
                                        255, 199, 199, 199),
                                    child: InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(6),
                                      splashColor: Colors.grey,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        height: 40,
                                        width: 50,
                                        child: const Center(
                                            child: Icon(
                                          Icons.more_horiz,
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const InformationsTile(
                                normalText: 'Studies at ',
                                boldText:
                                    "ESI - Ecole Nationale Supérieure d'informatique",
                                icon: Icons.school,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const InformationsTile(
                                normalText: 'From ',
                                boldText: "Batna, Algeria",
                                icon: Icons.location_pin,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const InformationsTile(
                                normalText: 'See more about yourself',
                                boldText: "",
                                icon: Icons.more_horiz_outlined,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Friends",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "510 friends",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 19),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "See all",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const MyDivder(),

                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Post",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UserProfileThumbnail(
                                      raduis: 50,
                                      userPicture: "assets/images/download.jpg",
                                      onPressed: () {},
                                      isActive: false),
                                  Material(
                                    color: const Color.fromARGB(
                                        255, 226, 223, 223),
                                    borderRadius: BorderRadius.circular(50),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(50),
                                      onTap: () {
                                        debugPrint("routed");
                                        context.goNamed("CreatePost");
                                      },
                                      child: Container(
                                        width: 250,
                                        height: 50,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: const Text(
                                          "Post a status update",
                                          style: TextStyle(fontSize: 19),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.photoVideo,
                                          size: 26,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  Positioned(
                    top: 90,
                    left: 340,
                    child: Column(
                      children: [
                        Material(
                          color: const Color.fromARGB(255, 199, 199, 199),
                          borderRadius: BorderRadius.circular(500),
                          child: InkWell(
                            splashColor: Colors.grey,
                            onTap: () {},
                            borderRadius: BorderRadius.circular(500),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(500)),
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 20,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(500),
                          color: const Color.fromARGB(255, 199, 199, 199),
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.grey,
                            borderRadius: BorderRadius.circular(500),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(500)),
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 20,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    left: 20,
                    top: 90,
                    child: Stack(
                      children: [
                        Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(500),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(500),
                            child: Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 4),
                                  borderRadius: BorderRadius.circular(500)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(500),
                                  child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(user.profilePicture))),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120,
                          top: 115,
                          child: Material(
                            borderRadius: BorderRadius.circular(500),
                            color: const Color.fromARGB(255, 199, 199, 199),
                            child: InkWell(
                              splashColor: Colors.grey,
                              onTap: () {},
                              borderRadius: BorderRadius.circular(500),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(500)),
                                child: const Center(
                                    child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black,
                                  size: 20,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
            } else {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
          }),
    );
  }
}

class MyDivder extends StatelessWidget {
  const MyDivder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: 20,
      child: Container(
        height: 7,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 106, 106, 106)),
      ),
    );
  }
}

class InformationsTile extends StatelessWidget {
  final String normalText;
  final String boldText;
  final IconData icon;
  const InformationsTile({
    super.key,
    required this.normalText,
    required this.boldText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 76, 76, 76),
          ),
          SizedBox(
            width: 320,
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style.copyWith(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontSize: 19,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(text: normalText),
                  TextSpan(
                    text: boldText,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final Color textColor;
  final Function() onTap;
  const ProfileButton({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        splashColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          height: 40,
          width: 152,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
              ),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Stream<UserModel?> readUser(String uid) {
  return FirebaseFirestore.instance
      .collection("users")
      .doc(uid) // Use the specific user's document ID
      .snapshots()
      .map((doc) {
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    } else {
      return null; // Return null if the document doesn't exist
    }
  });
}
