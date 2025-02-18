import 'package:clean_architecture_flutter/core/error/failures.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:dartz/dartz.dart';

class AddPost {
  final PostRepo _repo;

  AddPost(this._repo);

  Future<Either<Failure, Unit>> addPost(Post post) async {
    return await _repo.addPost(post);
  }
}
