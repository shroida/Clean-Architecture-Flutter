import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostsEvent {
  final Post post;

  const AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends PostsEvent {
  final Post post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends PostsEvent {
  final int postId;

  const DeletePostEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
