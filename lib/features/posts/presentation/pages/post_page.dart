import 'package:clean_architecture_flutter/features/posts/presentation/widgets/app_bar_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/card_post.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'id': 1,
        'title': 'Flutter UI Design',
        'body': 'Creating beautiful UIs with Flutter is easy!'
      },
      {
        'id': 2,
        'title': 'State Management',
        'body': 'Provider, Bloc, Riverpod - choose wisely!'
      },
      {
        'id': 3,
        'title': 'Animations in Flutter',
        'body': 'Add smooth animations to enhance UX.'
      },
    ];

    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: Colors.deepPurple[50],
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return CardPost(post: post);
        },
      ),
    );
  }
}