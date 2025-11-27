import 'package:dio/dio.dart';
import '../models/match_model.dart';
import '../services/dio_client.dart';

class MatchRepository {
  final DioClient _dioClient;

  MatchRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<List<MatchModel>> getMatches() async {
    try {
      final response = await _dioClient.dio.get('/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Limit to 10 matches for better UX
        return data.take(10).map((json) => MatchModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load matches');
      }
    } catch (e) {
      throw Exception('Failed to load matches: $e');
    }
  }
}
