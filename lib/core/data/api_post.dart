import 'dart:convert';
import '../models/post_model.dart';
import 'package:dio/dio.dart';

class PostApi {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Post>> getPosts() async {
    final dio = Dio();
    final response = await dio.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      final jsonData = response.data as List<dynamic>;// tidak perlu jsondecode
      final posts = jsonData
          .map((data) => Post.fromJson(data as Map<String, dynamic>))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
