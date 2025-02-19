import 'package:flutter/material.dart';

class BodyPost extends StatelessWidget {
  const BodyPost({
    super.key,
    required this.post,
  });

  final Map<String, dynamic> post;

  @override
  Widget build(BuildContext context) {
    return Text(
      post['body'],
      style: const TextStyle(fontSize: 16, color: Colors.black87),
    );
  }
}
