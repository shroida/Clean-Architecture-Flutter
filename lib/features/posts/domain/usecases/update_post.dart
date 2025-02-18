import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:dartz/dartz.dart';

class UpdatePost {
  final PostRepo _repo;

  UpdatePost(this._repo);

  Future<Either<Failure, Unit>> updatePost(Post post) async {
    return await _repo.updatePost(post);
  }
}
