import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_state.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/app_bar_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/loading_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/message_display_widget.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/widgets/posts_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(),
        backgroundColor: Colors.deepPurple[50],
        body: BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
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
