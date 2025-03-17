import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/data/model/post_model.dart';
import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/data/repository/api/api(basic).dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
