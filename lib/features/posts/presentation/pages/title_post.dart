import 'package:flutter/material.dart';

class TitlePost extends StatelessWidget {
  const TitlePost({
    super.key,
    required this.post,
  });

  final Map<String, dynamic> post;

  @override
  Widget build(BuildContext context) {
    return Text(
      post['title'],
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }
}
