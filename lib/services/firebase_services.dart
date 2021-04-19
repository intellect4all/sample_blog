import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_blog/models/post.dart';

class FirebaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addPosts(Post post) async {
    CollectionReference _posts = _firestore.collection('posts');
    try {
      var doc = await _posts.doc(post.slug).get();
      if (doc.exists){
        return 'post exists';
      }
      await _posts.doc(post.slug).set(post.toMap());
      return "success";
    } catch (e) {
      return "error";
    }
  }
}
