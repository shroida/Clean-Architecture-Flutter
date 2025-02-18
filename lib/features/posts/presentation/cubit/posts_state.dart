import 'package:equatable/equatable.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostsState {}

class LoadingPostsState extends PostsState {}

class ErrorPostsState extends PostsState {
  final String message;

  const ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessagePostsState extends PostsState {
  final String message;

  const MessagePostsState({required this.message});

  @override
  List<Object> get props => [message];
}
