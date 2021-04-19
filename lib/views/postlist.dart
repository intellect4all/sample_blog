import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_blog/utilities/utilities.dart';
import 'package:sample_blog/views/add_post.dart';

class PostList extends StatelessWidget {
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
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (build, context) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          elevation: 3,
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
                                      children: [
                                        Text(
                                          'Why finance doesn\'t have to be difficult',
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
                                              'Author goes here!',
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
                        );
                      },
                    ),
                  ),
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
