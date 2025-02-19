import 'package:clean_architecture_flutter/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/body_post.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/id_post.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/title_post.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      color: Colors.white,
      shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitlePost(post: post),
            const SizedBox(height: 8),
            BodyPost(post: post),
            const SizedBox(height: 15),
            IDPost(post: post),
          ],
        ),
      ),
    );
  }
}
