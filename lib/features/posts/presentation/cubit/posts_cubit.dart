import 'package:clean_architecture_flutter/core/strings/failures.dart';
import 'package:clean_architecture_flutter/core/strings/messages.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/update_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final AddPost addPost;
  final DeletePost deletePost;
  final UpdatePost updatePost;

  PostsCubit({
    required this.addPost,
    required this.deletePost,
    required this.updatePost,
  }) : super(PostInitial());

  Future<void> addNewPost(Post post) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await addPost.addPost(post);
    emit(_eitherDoneMessageOrErrorState(
        failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
  }

  Future<void> updateExistingPost(Post post) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await updatePost.updatePost(post);
    emit(_eitherDoneMessageOrErrorState(
        failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
  }

  Future<void> removePost(int postId) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await deletePost.deletePost(postId);
    emit(_eitherDoneMessageOrErrorState(
        failureOrDoneMessage, DELETE_SUCCESS_MESSAGE));
  }

  PostsState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (_) => MessagePostsState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case const (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected error, please try again later.";
    }
  }
}
