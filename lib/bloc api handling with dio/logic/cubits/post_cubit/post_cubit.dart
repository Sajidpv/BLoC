import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/data/model/post_model.dart';
import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/data/repository/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }
  PostRepository postRepository = PostRepository();
  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioException catch (e) {
      emit(PostErrorState(e.message.toString()));
    }
  }
}
