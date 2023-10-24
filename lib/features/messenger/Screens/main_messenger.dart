import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/components/user_profile_widgets.dart';
import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Material(
              color: Colors.white,
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    const Text(
                      "Messages",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    MyIconButton(icon: Icons.settings, onTap: () {}),
                    MyIconButton(icon: Icons.search, onTap: () {}),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {},
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: 90,
                      decoration: const BoxDecoration(color: Colors.white),
                      width: double.infinity,
                      child: ListView(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                        scrollDirection: Axis.horizontal,
                        children: const [
                          MessengerUser(
                            pictureURL: "assets/images/download.jpg",
                            firstName: "Your Story",
                            isActive: false,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          MessengerUser(
                            pictureURL: "assets/images/CJ.jpg",
                            firstName: "CJ",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          MessengerUser(
                            pictureURL: "assets/images/steve.jpg",
                            firstName: "Steve",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          MessengerUser(
                            pictureURL: "assets/images/crash.jpg",
                            firstName: "Crash",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          MessengerUser(
                            pictureURL: "assets/images/dingodile.jpg",
                            firstName: "DingoDile",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          MessengerUser(
                            pictureURL: "assets/images/joel.jpg",
                            firstName: "Joel",
                            isActive: true,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const MessengerTile(
                        isActive: true,
                        pictureURL: "assets/images/CJ.jpg",
                        firstName: "CJ",
                        lastName: "Gangster",
                        isMuted: true,
                        lastInteraction: "REPLY ON MY MESSAGES !!"),
                    const MessengerTile(
                        isActive: true,
                        pictureURL: "assets/images/steve.jpg",
                        firstName: "Steve",
                        lastName: "",
                        isMuted: false,
                        lastInteraction: "Hey wanna play bedwars ?"),
                    const MessengerTile(
                        isActive: true,
                        pictureURL: "assets/images/joel.jpg",
                        firstName: "Joel",
                        lastName: "",
                        isMuted: false,
                        lastInteraction: "Reacted ❤ to your message"),
                    const MessengerTile(
                        isActive: true,
                        pictureURL: "assets/images/download.jpg",
                        firstName: "Younes ",
                        lastName: "Hellalet",
                        isMuted: true,
                        lastInteraction: "Sup me ?"),
                    const MessengerTile(
                        isActive: false,
                        pictureURL: "assets/images/images.jpg",
                        firstName: "Rah ",
                        lastName: "Ma",
                        isMuted: false,
                        lastInteraction: "Reacted  😠 to your message"),
                    const MessengerTile(
                        isActive: true,
                        pictureURL: "assets/images/dingodile.jpg",
                        firstName: "Dingo",
                        lastName: "Dile",
                        isMuted: true,
                        lastInteraction: "Dingo Dingo Dingoooo"),
                    const MessengerTile(
                        isActive: false,
                        pictureURL: "assets/images/IMG20221027193308.jpg",
                        firstName: "نايلة ",
                        lastName: "الحكيمي",
                        isMuted: false,
                        lastInteraction: "امشي ترقد يا وحد الخرا"),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 300,
          top: 620,
          child: Material(
            color: const Color.fromARGB(255, 33, 100, 243),
            borderRadius: BorderRadius.circular(100),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class MessengerTile extends StatelessWidget {
  final String pictureURL;
  final String firstName;
  final String lastName;
  final bool isMuted;
  final String lastInteraction;
  final bool isActive;
  const MessengerTile({
    super.key,
    required this.pictureURL,
    required this.firstName,
    required this.lastName,
    required this.isMuted,
    required this.lastInteraction,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                UserProfileThumbnail(
                    isActive: isActive,
                    raduis: 55,
                    userPicture: pictureURL,
                    onPressed: () {}),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstName + lastName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      lastInteraction,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                isMuted ? const Icon(Icons.notifications_off) : Container()
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class MessengerUser extends StatelessWidget {
  final String pictureURL;
  final String firstName;
  final bool isActive;
  const MessengerUser({
    super.key,
    required this.pictureURL,
    required this.firstName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserProfileThumbnail(
                isActive: isActive,
                raduis: 55,
                userPicture: pictureURL,
                onPressed: () {}),
            const SizedBox(
              height: 5,
            ),
            Text(
              firstName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
