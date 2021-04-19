import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Post {
  String slug;
  String blogTitle;
  String blogContent;
  DateTime timestamp;
  Post(
      {@required this.blogTitle,
      @required this.blogContent,
      @required this.slug,
      @required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'slug': slug,
      'blogTitle': blogTitle,
      'blogContent': blogContent,
      'timestamp': timestamp,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      slug: map['slug'],
      blogTitle: map['blogTitle'],
      blogContent: map['blogContent'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  factory Post.fromSnapshot(QueryDocumentSnapshot snap) {
    return Post(
      slug: snap.data()["slug"],
      blogContent: snap.data()["blogContent"],
      blogTitle: snap.data()['blogTitle'],
      timestamp: snap.data()['timestamp'],
    );
  }
}
