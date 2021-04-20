import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_blog/models/post.dart';

class FirebaseServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> editPost(Post post, {String slug}) async {
    CollectionReference _posts = _firestore.collection('posts');

    try {
      var doc = await _posts.doc(slug).get();

      // checking if document exists before performing edit
      if (!doc.exists) {
        return 'null post';
      }

      // if the blog title doesn't change, it can maintain its previous ID
      if (slug == post.slug) {
        await _posts.doc(slug).update(post.toMap());
      } else {
        // else if document title changes, since firebase doc id cannot be edited, a new document with initial timestamp is created
        await _posts.doc(post.slug).set(post.toMap());
        // and the previous post deleted
        await _posts.doc(slug).delete();
      }

      print('success');
      return "success";
    } catch (e) {
      return "error";
    }
  }

// add blog post to the database
  Future<String> addPosts(Post post) async {
    CollectionReference _posts = _firestore.collection('posts');
    try {
      var doc = await _posts.doc(post.slug).get();
      if (doc.exists) {
        return 'post exists';
      }
      await _posts.doc(post.slug).set(post.toMap());
      return "success";
    } catch (e) {
      return "error";
    }
  }

// using a stream to get the data in order to watch for realtime changes
  Stream<QuerySnapshot> getPost() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<String> deletePost(String slug) async {
    CollectionReference _posts = _firestore.collection('posts');

    try {
      await _posts.doc(slug).delete();
      return "success";
    } catch (e) {
      return "error";
    }
  }
}
