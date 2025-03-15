part of 'post_cubit.dart';

abstract class PostState {}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<PostModel> posts;

  PostLoadedState(this.posts);
}

final class PostErrorState extends PostState {
  final String error;

  PostErrorState(this.error);
}
