import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_blog/views/postlist.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: PostList(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}
