import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllPosts {
  final PostRepo _repo;

  GetAllPosts(this._repo);
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    return await _repo.getAllPosts();
  }
}
