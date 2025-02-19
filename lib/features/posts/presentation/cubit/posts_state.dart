import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
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

class LoadedPostsState extends PostsState {
  final List<Post> posts;

  const LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class MessagePostsState extends PostsState {
  final String message;

  const MessagePostsState({required this.message});

  @override
  List<Object> get props => [message];
}
