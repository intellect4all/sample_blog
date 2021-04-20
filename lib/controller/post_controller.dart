import 'dart:async';

import 'package:get/get.dart';
import 'package:sample_blog/models/post.dart';
import 'package:sample_blog/services/firebase_services.dart';
import 'package:sample_blog/views/postlist.dart';

class PostController extends GetxController {
  FirebaseServices _firebaseServices = FirebaseServices();
  final postList = <Post>[].obs;
  StreamSubscription _listener;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

// this function edits the post
  Future<void> editPost(Post post, {String slug}) async {
    var res = await _firebaseServices.editPost(post, slug: slug);

    if (res == "success") {
      Get.offAll(() => PostList());
      Get.snackbar('Success', 'Post edited successfully');
    } else {
      Get.snackbar('Error',
          'Something went wrong while updating the post. Please try again');
    }
  }

  Future<void> addPost(Post post) async {
    var res = await _firebaseServices.addPosts(post);
    if (res == 'post exists') {
      Get.snackbar('Post Exists', 'This posts already exists');
    } else if (res == "success") {
      Get.back();
      Get.snackbar('Success', 'Post has been added to collection');
    } else {
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    }
  }

  Future<void> fetchData() async {
    _listener = _firebaseServices.getPost().listen(
      (event) {
        postList.assignAll(
            event.docs.map((doc) => Post.fromSnapshot(doc)).toList());
      },
    );
  }

  Future<void> deletePost(String slug) async {
    var res = await _firebaseServices.deletePost(slug);
    if (res == "success") {
      Get.back();
      Get.snackbar('Success', 'Post has been successfully deleted.');
    } else {
      Get.snackbar('Error', 'Something happened while deleting');
    }
  }
}
