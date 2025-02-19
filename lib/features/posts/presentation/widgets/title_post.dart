import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';

class TitlePost extends StatelessWidget {
  const TitlePost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Text(
      post.title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }
}
