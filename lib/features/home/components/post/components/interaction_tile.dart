import 'package:facebook_clone_app/features/home/components/post/post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostInteractions extends StatelessWidget {
  final int angry;
  final int wow;
  final int love;
  final int care;
  final int like;
  final int haha;
  final int sad;
  final Map<User, Interaction> interactors;
  final List<Comment> comments;
  final List<Share> share;
  const PostInteractions(
      {super.key,
      required this.angry,
      required this.wow,
      required this.love,
      required this.care,
      required this.like,
      required this.haha,
      required this.sad,
      required this.interactors,
      required this.comments,
      required this.share});

  @override
  Widget build(BuildContext context) {
    const String first = "assets/icons/facebook_reaction_icons/love.png";
    const String second = "assets/icons/facebook_reaction_icons/wow.png";
    const String third = "assets/icons/facebook_reaction_icons/care.png";
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(7, 0, 7, 5),
      child: const Column(children: [
        InteractionsTile(third: third, second: second, first: first),
        SizedBox(
          height: 10,
        ),
        ButtonsTile(),
      ]),
    );
  }
}

class InteractionsTile extends StatelessWidget {
  const InteractionsTile({
    super.key,
    required this.third,
    required this.second,
    required this.first,
  });

  final String third;
  final String second;
  final String first;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(
              left: 35,
              child: Image(
                image: AssetImage(
                  third,
                ),
                width: 22,
              ),
            ),
            Positioned(
              left: 17,
              child: Image(
                image: AssetImage(second),
                width: 22,
              ),
            ),
            Positioned(
              child: Image(
                image: AssetImage(first),
                width: 22,
              ),
            ),
            const Positioned(
              left: 70,
              child: SizedBox(
                child: Text(
                  "Younes Hellalet and 632 others",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 19, color: Color.fromARGB(172, 0, 0, 0)),
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonsTile extends StatelessWidget {
  const ButtonsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyInteractionButton(
            icon: Icons.thumb_up_alt_outlined, number: 633, onPressed: () {}),
        MyInteractionButton(
            icon: Icons.comment_bank_outlined, number: 477, onPressed: () {}),
        MyInteractionButton(icon: Icons.share, number: 36, onPressed: () {}),
      ],
    );
  }
}

class MyInteractionButton extends StatelessWidget {
  final IconData icon;
  final int number;
  final Function() onPressed;
  const MyInteractionButton(
      {super.key,
      required this.icon,
      required this.number,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(500),
      color: const Color.fromARGB(255, 220, 217, 217),
      child: InkWell(
        borderRadius: BorderRadius.circular(500),
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Color.fromARGB(255, 99, 99, 99), size: 25),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$number",
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Interaction {}
// order the nubmers
// then make
