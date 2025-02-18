import 'package:clean_architecture_flutter/features/posts/data/models/post_model.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> addPost(Post post);
  Future<Unit> updatePost(Post post);
}

class RemotePostDataSource implements PostRemoteDataSource {
  @override
  Future<Unit> addPost(Post post) {}

  @override
  Future<Unit> deletePost(int postId) {}

  @override
  Future<List<PostModel>> getAllPosts() {}

  @override
  Future<Unit> updatePost(Post post) {}
}
