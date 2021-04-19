import 'package:get/get.dart';
import 'package:sample_blog/models/post.dart';
import 'package:sample_blog/services/firebase_services.dart';

class PostController extends GetxController {
  FirebaseServices _firebaseServices = FirebaseServices();
  List postLists = [];
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> addPost(Post post) async {
    // print(post.toMap().toString());
    var res = await _firebaseServices.addPosts(post);
    if (res == 'post exists') {
      Get.snackbar('Post Exists', 'This posts already exists');
    } else if (res == "success") {
      Get.snackbar('Success', 'Post has been added to collection');
    } else {
      Get.snackbar('Error', 'Something went wrong. Please try again later.');
    }
  }
}
