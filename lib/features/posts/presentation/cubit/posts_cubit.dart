import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../domain/usecases/add_post_usecase.dart';
import '../../domain/usecases/delete_post_usecase.dart';
import '../../domain/usecases/update_post_usecase.dart';
import 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final AddPostUsecase addPost;
  final DeletePostUsecase deletePost;
  final UpdatePostUsecase updatePost;

  PostsCubit({
    required this.addPost,
    required this.deletePost,
    required this.updatePost,
  }) : super(PostsInitial());

  Future<void> addNewPost(Post post) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await addPost(post);
    emit(_eitherDoneMessageOrErrorState(
        failureOrDoneMessage, ADD_SUCCESS_MESSAGE));
  }

  Future<void> updateExistingPost(Post post) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await updatePost(post);
    emit(_eitherDoneMessageOrErrorState(
        failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE));
  }

  Future<void> removePost(int postId) async {
    emit(LoadingPostsState());
    final failureOrDoneMessage = await deletePost(postId);
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
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected error, please try again later.";
    }
  }
}
