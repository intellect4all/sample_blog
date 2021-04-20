import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sample_blog/models/post.dart';
import 'package:sample_blog/utilities/utilities.dart';
import 'package:sample_blog/views/edit_post.dart';
import 'package:string_extensions/string_extensions.dart';

class PostDetails extends StatelessWidget {
  final Post post;
  const PostDetails({
    Key key,
    @required this.post,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: spacing, vertical: spacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 35,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Post Details',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Get.to(() => EditPost(post: post));
                          },
                          child: Text(
                            'Edit',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              height: 1.3,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Text(
                post.blogTitle.toTitleCase(),
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(post.blogContent)
            ],
          ),
        ),
      ),
    );
  }
}
