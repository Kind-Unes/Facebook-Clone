import 'package:facebook_clone_app/core/components/my_buttons.dart';
import 'package:flutter/material.dart';

class PostComment extends StatelessWidget {
  const PostComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const GoBackButton(
          color: Colors.black,
          path: "Home",
          size: 30,
        ),
        title: const Text(
          "Post's title",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: const Column(children: [SingleChildScrollView()]),
    );
  }
}
