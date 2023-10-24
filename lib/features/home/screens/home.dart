import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/auth/controllers/authentication_service.dart';
import 'package:facebook_clone_app/features/home/components/add_to_story.dart';
import 'package:facebook_clone_app/features/home/components/my_tab.dart';
import 'package:facebook_clone_app/features/home/components/post/post.dart';
import 'package:facebook_clone_app/features/home/components/story.dart';
import 'package:facebook_clone_app/features/home/controllers/tab_bar_index_provider.dart';
import 'package:facebook_clone_app/features/messenger/Screens/main_messenger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: Provider.of<TabSelectionModel>(context).selectedIndex == 0
            ? AppBar(
                elevation: 1,
                bottom: TabBar(
                  onTap: (index) {
                    context.read<TabSelectionModel>().setTabIndex(index);
                  },
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  dividerColor: Colors.amber,
                  indicatorColor: Colors.white,
                  tabs: [
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          0,
                      icon: FontAwesomeIcons.home,
                      regularIcon: FontAwesomeIcons.home,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          1,
                      icon: FontAwesomeIcons.userFriends,
                      regularIcon: FontAwesomeIcons.userFriends,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          2,
                      icon: FontAwesomeIcons.facebookMessenger,
                      regularIcon: FontAwesomeIcons.facebookMessenger,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          3,
                      icon: FontAwesomeIcons.solidBell,
                      regularIcon: FontAwesomeIcons.bell,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          4,
                      icon: FontAwesomeIcons.youtubeSquare,
                      regularIcon: FontAwesomeIcons.youtubeSquare,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          5,
                      icon: FontAwesomeIcons.store,
                      regularIcon: FontAwesomeIcons.store,
                    ),
                  ],
                ),
                actions: [
                  MyIconButton(icon: FontAwesomeIcons.plus, onTap: () {}),
                  MyIconButton(icon: FontAwesomeIcons.search, onTap: () {}),
                  MyIconButton(
                      icon: FontAwesomeIcons.bars,
                      onTap: () {
                        AuthService(
                                auth: FirebaseAuth.instance,
                                firestore: FirebaseFirestore.instance)
                            .signOut();
                        context.goNamed("MainAuth");
                      })
                ],
                title: const Text(
                  "facebook",
                  style: TextStyle(
                      fontFamily: "klavika",
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ))
            : AppBar(
                elevation: 1,
                toolbarHeight: 0,
                bottom: TabBar(
                  onTap: (index) {
                    context.read<TabSelectionModel>().setTabIndex(index);
                  },
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  dividerColor: Colors.amber,
                  indicatorColor: Colors.white,
                  tabs: [
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          0,
                      icon: FontAwesomeIcons.home,
                      regularIcon: FontAwesomeIcons.home,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          1,
                      icon: FontAwesomeIcons.userFriends,
                      regularIcon: FontAwesomeIcons.userFriends,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          2,
                      icon: FontAwesomeIcons.facebookMessenger,
                      regularIcon: FontAwesomeIcons.facebookMessenger,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          3,
                      icon: FontAwesomeIcons.solidBell,
                      regularIcon: FontAwesomeIcons.bell,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          4,
                      icon: FontAwesomeIcons.youtubeSquare,
                      regularIcon: FontAwesomeIcons.youtubeSquare,
                    ),
                    MyTab(
                      isSelected: Provider.of<TabSelectionModel>(context)
                              .selectedIndex ==
                          5,
                      icon: FontAwesomeIcons.store,
                      regularIcon: FontAwesomeIcons.store,
                    ),
                  ],
                ),
              ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling

            children: [
              const ScrollHome(),
              Container(),
              const Messenger(),
              Container(),
              Container(),
              Container(),
            ]),
      ),
    );
  }
}

class ScrollHome extends StatelessWidget {
  const ScrollHome({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        children: [
          Container(
            height: 70,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(children: [
                    InkWell(
                      onTap: () {
                        context.goNamed("Profile");
                      },
                      borderRadius: BorderRadius.circular(500),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500)),
                        child: ClipOval(
                            child: Image.asset(
                          "assets/images/download.jpg",
                          height: 50,
                        )),
                      ),
                    ),
                    Positioned(
                        top: 32,
                        left: 35,
                        child: Container(
                          height: 17,
                          width: 17,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(200),
                              color: MyColors.activeStatus),
                        ))
                  ]),
                  Material(
                    color: const Color.fromARGB(255, 226, 223, 223),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "What's on your mind?",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.photoVideo,
                          size: 26,
                        ),
                        Text(
                          "Photo",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(7),
                children: const [
                  AddStory(),
                  SizedBox(
                    width: 5,
                  ),
                  Story(
                      picture: "assets/images/download.jpg",
                      stroiesNumber: 96,
                      firstName: "YouNes",
                      lastName: "Hellalet"),
                  SizedBox(
                    width: 5,
                  ),
                  Story(
                      picture: "assets/images/images.jpg",
                      stroiesNumber: 1,
                      firstName: "Rah",
                      lastName: "Ma"),
                  SizedBox(
                    width: 5,
                  ),
                  Story(
                      picture: "assets/images/IMG20221027193308.jpg",
                      stroiesNumber: 12,
                      firstName: "نايلة",
                      lastName: "الحكيمي"),
                  SizedBox(
                    width: 5,
                  ),
                ],
              )),
          const Post(
            firstName: "Younes",
            lastName: "Hellalet",
            timeAgo: "45m",
            textContent: "Hello i'm Unes and i'm so fucking awesome :D",
            userPicture: 'assets/images/download.jpg',
            bodyPictures: [],
          )
        ],
      ),
    );
  }
}
