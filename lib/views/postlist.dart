import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_blog/controller/post_controller.dart';
import 'package:sample_blog/models/post.dart';
import 'package:sample_blog/utilities/utilities.dart';
import 'package:sample_blog/views/add_post.dart';
import 'package:string_extensions/string_extensions.dart';
import 'package:intl/intl.dart';

class PostList extends StatelessWidget {
  final _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Container(
              height: Get.height - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blog Posts',
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: spacing),
                  Obx(() {
                    return Expanded(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: _postController.postList.length,
                          itemBuilder: (context, index) {
                            Post _post = _postController.postList[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              elevation: 3,
                              child: InkWell(
                                onTap: () {
                                  print(_post.slug);
                                },
                                onLongPress: () {
                                  return Get.bottomSheet(
                                    Container(
                                      padding: EdgeInsets.all(spacing),
                                      height: 200,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Text(
                                            'Do you want to delete this article titled ${_postController.postList[index].blogTitle}?',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Cancel',
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
                                              SizedBox(
                                                width: 50,
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  await _postController
                                                      .deletePost(_post.slug);
                                                },
                                                child: Text(
                                                  'Delete',
                                                  style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    height: 1.3,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 140,
                                        color: Colors.redAccent,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(spacing),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _post.blogTitle.capitalizeFirst,
                                                style: GoogleFonts.lato(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                  height: 1.3,
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: double.infinity,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    DateFormat.MMMMEEEEd()
                                                        .format(
                                                            _post.timestamp),
                                                    style: GoogleFonts.lato(
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.red,
        ),
        child: GestureDetector(
          onTap: () => Get.to(() => AddPost()),
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
