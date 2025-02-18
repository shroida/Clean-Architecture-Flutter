import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:dartz/dartz.dart';

class DeletePost {
  final PostRepo _repo;

  DeletePost(this._repo);

  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await _repo.deletePost(id);
  }
}
