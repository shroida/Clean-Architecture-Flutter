import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/data/datasources/PostLocalDataSource.dart';
import 'package:clean_architecture_flutter/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImpl extends PostRepo {
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;

  PostRepoImpl(this.postRemoteDataSource, this.postLocalDataSource);

  @override
  Future<Either<Failure, Unit>> addPost(Post id) {}

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {}

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() {}

  @override
  Future<Either<Failure, Unit>> updatePost(Post id) {}
}
