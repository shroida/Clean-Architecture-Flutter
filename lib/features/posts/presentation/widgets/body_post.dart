import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';

class BodyPost extends StatelessWidget {
  const BodyPost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Text(
      post.body,
      style: const TextStyle(fontSize: 16, color: Colors.black87),
    );
  }
}
