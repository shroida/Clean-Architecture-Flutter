import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/card_post.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return CardPost(post: posts[index]);
      },
    );
  }
}
