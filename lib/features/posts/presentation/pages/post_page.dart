import 'package:clean_architecture_flutter/core/theming/app_theme.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_state.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/app_bar_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/card_post.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/loading_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/message_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
          if (state is LoadingPostsState) {
            const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: PostListWidget(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        }));
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsCubit>(context).refreshPosts();
  }
}
