import 'package:clean_architecture_flutter/core/networking/network_info.dart';
import 'package:clean_architecture_flutter/features/posts/data/repos/post_repo_impl.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repos/post_repo.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_architecture_flutter/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecture_flutter/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/get_all_posts.dart';
import 'package:clean_architecture_flutter/features/posts/domain/usecases/update_post.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Posts
  // UseCases
  sl.registerLazySingleton(() => GetAllPosts(sl()));
  sl.registerLazySingleton(() => AddPost(sl()));
  sl.registerLazySingleton(() => DeletePost(sl()));
  sl.registerLazySingleton(() => UpdatePost(sl()));

  // Repository
  sl.registerLazySingleton<PostRepo>(
    () => PostRepoImpl(
        networkInfo: sl(), postLocalDataSource: sl(), remoteDataSource: sl()),
  );

  // DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(sharedPreferences: sl()),
  );
  // Register Cubit
  sl.registerFactory(
      () => PostsCubit(addPost: sl(), deletePost: sl(), updatePost: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // HTTP Client
  sl.registerLazySingleton(() => http.Client());
}
