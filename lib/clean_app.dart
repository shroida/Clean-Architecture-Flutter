import 'package:clean_architecture_flutter/core/theming/app_theme.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/dependency_injection.dart' as di;

class CleanApp extends StatelessWidget {
  const CleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>di.sl<PostsCubit>()),
      ],
      child: MaterialApp(
        theme: appTheme,
        home: const Scaffold(
          body:
        ),
      ),
    );
  }
}
