import 'package:clean_architecture_flutter/features/posts/presentation/widgets/app_bar_widget.dart';
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
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            color: Colors.white,
            shadowColor: Colors.deepPurpleAccent.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['body'],
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'ID: ${post['id']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
