import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_app_name/models/movie.dart';

class MovieService {
  static const String baseUrl = 'your_movie_api_base_url'; // Replace with your movie API base URL

  static Future<List<Movie>> fetchTopRatedMovies() async {
    try {
      // Make a request to fetch top-rated movies from the API
      final response = await http.get(Uri.parse('$baseUrl/top_rated_movies'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Movie> movies = data.map((movieData) => Movie.fromJson(movieData)).toList();
        return movies;
      } else {
        // Handle error cases
        return [];
      }
    } catch (error) {
      // Handle network or other errors
      return [];
    }
  }

  static Future<List<Movie>> searchMovies(String query) async {
    try {
      // Make a request to search for movies using the provided query
      final response = await http.get(Uri.parse('$baseUrl/search_movies?query=$query'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Movie> movies = data.map((movieData) => Movie.fromJson(movieData)).toList();
        return movies;
      } else {
        // Handle error cases
        return [];
      }
    } catch (error) {
      // Handle network or other errors
      return [];
    }
  }
}
