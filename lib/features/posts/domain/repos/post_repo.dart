import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';

abstract class PostRepo {
  Future<List<Post>> getAllPosts();
  Future<bool> deletePost(int id);
  Future<bool> updatePost(Post id);
  Future<bool> addPost(Post id);
}
