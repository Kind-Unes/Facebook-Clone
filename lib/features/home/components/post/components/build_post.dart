import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PostBody extends StatelessWidget {
  final String text;
  final List<String> bodyPictures;
  const PostBody({super.key, required this.text, required this.bodyPictures});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            bodyPictures.isEmpty
                ? assignText()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: ReadMoreText(
                      text,
                      textAlign: TextAlign.justify,
                      trimLength: 100,
                      moreStyle: const TextStyle(
                          color: Color.fromARGB(255, 119, 117, 117)),
                      lessStyle: const TextStyle(
                          color: Color.fromARGB(255, 109, 107, 107)),
                      trimCollapsedText: " read more",
                      trimExpandedText: "  show less",
                      trimMode: TrimMode.Length,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
            assignPicture()
          ]),
    );
  }

  Widget assignPicture() {
    if (bodyPictures.isNotEmpty) {
      return PhotoBody(
        bodyPictures: bodyPictures,
      );
    }
    return Container();
  }

  Widget assignText() {
    if (text.isEmpty) {
      return Container();
    }
    return TextBody(text: text);
  }
}

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(7, 0, 7, 10),
        child: text.length > 100
            ? ReadMoreText(
                text,
                textAlign: TextAlign.justify,
                trimLength: 100,
                moreStyle:
                    const TextStyle(color: Color.fromARGB(255, 119, 117, 117)),
                lessStyle:
                    const TextStyle(color: Color.fromARGB(255, 109, 107, 107)),
                trimCollapsedText: " read more",
                trimExpandedText: "  show less",
                trimMode: TrimMode.Length,
                style: const TextStyle(fontSize: 22),
              )
            : AutoSizeText(
                (text),
                textAlign: TextAlign.justify,

                style: TextStyle(
                    fontSize: calculateFontSize(
                        text.length)), // Adjust the font size as needed
                // Set the maximum number of lines you want to display
              ));
  }

  double calculateFontSize(int textLength) {
    if (textLength <= 10) {
      return 35.0;
    } else if (textLength <= 20) {
      return 30.0;
    } else if (textLength <= 30) {
      return 28.0;
    } else if (textLength <= 40) {
      return 27.0;
    } else if (textLength <= 50) {
      return 26.0;
    } else if (textLength <= 60) {
      return 26.0;
    } else if (textLength <= 70) {
      return 26.0;
    } else if (textLength <= 80) {
      return 25.0;
    } else if (textLength <= 90) {
      return 24.0;
    } else if (textLength <= 100) {
      return 23.0;
    } else {
      return 23.0; // Set the constant font size for text lengths greater than 160
    }
  }
}

class PhotoBody extends StatelessWidget {
  final List<String> bodyPictures;

  const PhotoBody({super.key, required this.bodyPictures});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Image.asset(
        bodyPictures[0],
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
