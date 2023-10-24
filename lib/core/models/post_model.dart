// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Post {
  final String text;
  final String firstName;
  final String lastName;
  final String timeAgo;
  final String userPicture;
  final int angry;
  final int sad;
  final int haha;
  final int like;
  final int love;
  final int care;
  final int wow;
  final List<Comment> comments;
  final List<String> bodyPictures;
  Post({
    required this.text,
    required this.firstName,
    required this.lastName,
    required this.timeAgo,
    required this.userPicture,
    required this.angry,
    required this.sad,
    required this.haha,
    required this.like,
    required this.love,
    required this.care,
    required this.wow,
    required this.comments,
    required this.bodyPictures,
  });

  Post copyWith({
    String? text,
    String? firstName,
    String? lastName,
    String? timeAgo,
    String? userPicture,
    int? angry,
    int? sad,
    int? haha,
    int? like,
    int? love,
    int? care,
    int? wow,
    List<Comment>? comments,
    List<String>? bodyPictures,
  }) {
    return Post(
      text: text ?? this.text,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      timeAgo: timeAgo ?? this.timeAgo,
      userPicture: userPicture ?? this.userPicture,
      angry: angry ?? this.angry,
      sad: sad ?? this.sad,
      haha: haha ?? this.haha,
      like: like ?? this.like,
      love: love ?? this.love,
      care: care ?? this.care,
      wow: wow ?? this.wow,
      comments: comments ?? this.comments,
      bodyPictures: bodyPictures ?? this.bodyPictures,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'firstName': firstName,
      'lastName': lastName,
      'timeAgo': timeAgo,
      'userPicture': userPicture,
      'angry': angry,
      'sad': sad,
      'haha': haha,
      'like': like,
      'love': love,
      'care': care,
      'wow': wow,
      'comments': comments.map((x) => x.toMap()).toList(),
      'bodyPictures': bodyPictures,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
        text: map['text'] as String,
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        timeAgo: map['timeAgo'] as String,
        userPicture: map['userPicture'] as String,
        angry: map['angry'] as int,
        sad: map['sad'] as int,
        haha: map['haha'] as int,
        like: map['like'] as int,
        love: map['love'] as int,
        care: map['care'] as int,
        wow: map['wow'] as int,
        comments: List<Comment>.from(
          (map['comments'] as List<int>).map<Comment>(
            (x) => Comment.fromMap(x as Map<String, dynamic>),
          ),
        ),
        bodyPictures: List<String>.from(
          (map['bodyPictures'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(text: $text, firstName: $firstName, lastName: $lastName, timeAgo: $timeAgo, userPicture: $userPicture, angry: $angry, sad: $sad, haha: $haha, like: $like, love: $love, care: $care, wow: $wow, comments: $comments, bodyPictures: $bodyPictures)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.timeAgo == timeAgo &&
        other.userPicture == userPicture &&
        other.angry == angry &&
        other.sad == sad &&
        other.haha == haha &&
        other.like == like &&
        other.love == love &&
        other.care == care &&
        other.wow == wow &&
        listEquals(other.comments, comments) &&
        listEquals(other.bodyPictures, bodyPictures);
  }

  @override
  int get hashCode {
    return text.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        timeAgo.hashCode ^
        userPicture.hashCode ^
        angry.hashCode ^
        sad.hashCode ^
        haha.hashCode ^
        like.hashCode ^
        love.hashCode ^
        care.hashCode ^
        wow.hashCode ^
        comments.hashCode ^
        bodyPictures.hashCode;
  }
}

class Comment {
  final String comment;
  Comment({
    required this.comment,
  });

  Comment copyWith({
    String? comment,
  }) {
    return Comment(
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comment': comment,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      comment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comment(comment: $comment)';

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.comment == comment;
  }

  @override
  int get hashCode => comment.hashCode;
}
