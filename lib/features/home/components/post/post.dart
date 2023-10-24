import 'package:facebook_clone_app/core/constants/constants.dart';
import 'package:facebook_clone_app/features/home/components/post/components/build_post.dart';
import 'package:facebook_clone_app/features/home/components/post/components/header.dart';
import 'package:facebook_clone_app/features/home/components/post/components/interaction_tile.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String timeAgo;
  final String textContent;
  final List<Comment>? comments;
  final List<List<Interqation>>? interactions;
  final List<Share>? shared;
  final String userPicture;
  final List<String> bodyPictures;

  const Post(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.timeAgo,
      required this.textContent,
      this.comments,
      this.interactions,
      this.shared,
      required this.userPicture,
      required this.bodyPictures});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PostHeader(
              onPressed: () {},
              privacy: PrivacyStatus.friends,
              firstName: firstName,
              lastName: lastName,
              userPicture: userPicture,
              timeAgo: timeAgo),
          PostBody(
            text: textContent,
            bodyPictures: bodyPictures,
          ),
          const PostInteractions(
              angry: 0,
              wow: 3,
              love: 404,
              care: 44,
              like: 20,
              haha: 5,
              sad: 6,
              interactors: {},
              comments: [],
              share: [])
        ],
      ),
    );
  }
}

class Share {}

class Interqation {}

class Comment {}
