import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, bool>> deletePost(int id);
  Future<Either<Failure, bool>> updatePost(Post id);
  Future<Either<Failure, bool>> addPost(Post id);
}
