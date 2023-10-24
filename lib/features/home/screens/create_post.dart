import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/user_profile_widgets.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const GoBackButton(
            color: Colors.black,
            size: 30,
            path: "/home",
          ),
          toolbarHeight: 60,
          title: const Text(
            "Create Post",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("POST",
                        style: TextStyle(
                            color: MyColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(children: [
            ListTile(
              leading: UserProfileThumbnail(
                  isActive: false,
                  raduis: 57,
                  userPicture: "assets/images/download.jpg",
                  onPressed: () {}),
              title: UserFullName(
                  firstName: "Younes", lastName: "Hellalet", onPressed: () {}),
              subtitle: SizedBox(
                height: 30,
                width: 20,
                child: InkWell(
                  borderRadius: BorderRadius.circular(7),
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.public, color: Color.fromARGB(219, 0, 0, 0)),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Public",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(106, 226, 224, 224),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              height: 240,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(133, 158, 158, 158)),
                    borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      hintText: "What's on your mind?",
                      hintStyle: TextStyle(fontSize: 20),
                      labelStyle: TextStyle(fontSize: 50),
                      enabledBorder: null,
                      errorBorder: null,
                      border: null,
                      focusedBorder: InputBorder.none,
                      disabledBorder: null,
                      focusedErrorBorder: null,
                      fillColor: Colors.white),
                  maxLines: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  ColorSquare(
                      isSelected: true,
                      onTap: () {},
                      color: const Color.fromARGB(255, 240, 239, 239)),
                  ColorSquare(
                      isSelected: false, onTap: () {}, color: Colors.redAccent),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.orangeAccent),
                  ColorSquare(
                      isSelected: false, onTap: () {}, color: Colors.black),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.greenAccent),
                  ColorSquare(
                      isSelected: false, onTap: () {}, color: Colors.blueGrey),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.purpleAccent),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.pinkAccent),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.yellowAccent),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.blueAccent),
                  ColorSquare(
                      isSelected: false,
                      onTap: () {},
                      color: Colors.limeAccent),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            const MyCustomTile(
                icon: Icons.photo_library_outlined,
                text: "Photos/videos",
                color: Colors.green),
            const MyCustomTile(
                icon: Icons.person_add_alt_1,
                text: "Tag friends",
                color: Color.fromARGB(255, 3, 80, 223)),
            const MyCustomTile(
                icon: Icons.location_on_sharp,
                text: "Add location",
                color: Colors.pink),
            const MyCustomTile(
                icon: Icons.tag_faces_rounded,
                text: "Feeling/activity",
                color: Colors.orangeAccent),
            const MyCustomTile(
                icon: Icons.event_note,
                text: "Create event",
                color: Colors.red),
            const MyCustomTile(
                icon: Icons.video_camera_back,
                text: "Go live",
                color: Colors.redAccent),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: MyDefaultButton(
                  buttonColor: MyColors.primaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                  text: "POST",
                  onClicked: () {}),
            )
          ]),
        ),
      ),
    );
  }
}

class MyCustomTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const MyCustomTile({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 35,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 23,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}

class ColorSquare extends StatelessWidget {
  final Function() onTap;
  final Color color;
  final bool isSelected;
  const ColorSquare({
    super.key,
    required this.onTap,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        isSelected
            ? Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 1, 99, 179),
                    borderRadius: BorderRadius.circular(500)),
                height: 2,
                width: 40,
              )
            : Container()
      ],
    );
  }
}
