import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sample_blog/controller/post_controller.dart';
import 'package:sample_blog/models/post.dart';
import 'package:sample_blog/utilities/config.dart';

class EditPost extends StatelessWidget {
  final Post post;
  EditPost({
    Key key,
    @required this.post,
  }) : super(key: key);

  PostController _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController =
        TextEditingController(text: post.blogTitle);
    TextEditingController _contentController =
        TextEditingController(text: post.blogContent);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(spacing),
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
                          'Add Post',
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
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Title',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: spacing / 2),
                TextField(
                  controller: _titleController,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    height: 1.3,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    hintText: 'Enter Title here',
                    contentPadding: EdgeInsets.all(16),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: spacing * 2),
                Text(
                  'Content',
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: spacing / 2),
                TextField(
                  controller: _contentController,
                  maxLines: 10,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    height: 1.3,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    hintText: 'Enter content here',
                    contentPadding: EdgeInsets.all(16),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    if (_titleController.text.trim() != "" &&
                        _titleController.text.trim() != "") {
                      String slug =
                          _titleController.text.trim().replaceAll(" ", "-");
                      
                      Post newPost = Post(
                        blogTitle: _titleController.text.trim(),
                        blogContent: _contentController.text.trim(),
                        slug: slug,
                        timestamp: post.timestamp,
                      );
                      var response = await _postController.editPost(newPost, slug: post.slug);
                    } else {
                      Get.snackbar('Empty Contents',
                          "You cannot leave any of the fiedls empty");
                    }
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
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
