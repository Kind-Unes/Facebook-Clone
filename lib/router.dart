import 'package:facebook_clone_app/features/auth/screens/find_my_account.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_date.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_email.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_finishing.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_gender.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_name.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_password.dart';
import 'package:facebook_clone_app/features/auth/screens/join_facebook_phone_number.dart';
import 'package:facebook_clone_app/features/auth/screens/login.dart';
import 'package:facebook_clone_app/features/auth/screens/login_state_page.dart';
import 'package:facebook_clone_app/features/auth/screens/main_auth.dart';
import 'package:facebook_clone_app/features/home/screens/create_post.dart';
import 'package:facebook_clone_app/features/home/screens/home.dart';
import 'package:facebook_clone_app/features/profile/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/components/router_animation_widget.dart';

class MyRouter {
  GoRouter router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      initialLocation:
          // "/signin_introduction/signin_fullname/signin_email/signin_birthday/signin_gender/signin_password/signin_finish",
          "/state_page",
      routes: [
        // State Page Decider
        customTransitionRoute(
            const HomeScreen(), "/state_page", "StatePage", []),

        /// Post creation Path
        customTransitionRoute(const Home(), "/home", "Home", [
          customTransitionRoute(const ProfilePage(), "profile", "Profile", []),
          customTransitionRoute(
              const CreatePost(), "create_post", "CreatePost", []),
        ]),
        // Sign In Paths (Email/Mobile):
        //? Mobile signIn path
        customTransitionRoute(const MainAutth(), "/", "MainAuth", [
          // LogIn Routes
          customTransitionRoute(const LogIn(), "login", "LogIn", []),
          // LogIn Routes
          customTransitionRoute(
              const FindMyAccount(), "find_my_account", "FindMyAccount", []),
          // Create New Account Routes
          customTransitionRoute(const JoinFacebookFirst(),
              "signin_introduction", "Introduction", [
            customTransitionRoute(
                const JoinFacebookSecond(), "signin_fullname", "FullName", [
              customTransitionRoute(
                  const JoinFacebookFourth(), "signin_mobile", "Mobile", []),
              customTransitionRoute(
                  const JoinFacebookThird(), "signin_email", "Email", [
                customTransitionRoute(
                    const JoinFacebookFifth(), "signin_birthday", "Birthday", [
                  customTransitionRoute(
                      const JoinFacebookSixth(), "signin_gender", "Gender", [
                    customTransitionRoute(const JoinFacebookSeventh(),
                        "signin_password", "Password", [
                      customTransitionRoute(const JoinFacebookLast(),
                          "signin_finish", "Finish", []),
                    ]),
                  ]),
                ]),
              ]),
            ]),
          ]),
        ])
      ]);
}
