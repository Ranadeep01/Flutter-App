import 'package:flutter/foundation.dart';
import 'package:your_app_name/models/movie.dart';

class AppState with ChangeNotifier {
  List<Movie> _topRatedMovies = [];
  List<Movie> _searchResults = [];
  List<Movie> _favoriteMovies = [];

  List<Movie> get topRatedMovies => _topRatedMovies;
  List<Movie> get searchResults => _searchResults;
  List<Movie> get favoriteMovies => _favoriteMovies;

  void setTopRatedMovies(List<Movie> movies) {
    _topRatedMovies.addAll(movies);
    notifyListeners();
  }

  void setSearchResults(List<Movie> movies) {
    _searchResults = movies;
    notifyListeners();
  }

  void addToFavorites(Movie movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie);
      notifyListeners();
    }
  }

  void removeFromFavorites(Movie movie) {
    _favoriteMovies.remove(movie);
    notifyListeners();
  }
}
