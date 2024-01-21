// A class representing a movie with a title, poster URL, year, and IMDb rating.

class Movie {
  // The title of the movie.
  final String title;

  // The URL of the movie poster.
  final String posterUrl;

  // The year the movie was released.
  final int year;

  // The IMDb rating of the movie.
  final double imdbRating;

  // Constructs a new Movie instance.
  Movie({
    required this.title,
    required this.posterUrl,
    required this.year,
    required this.imdbRating,
  });

  // Creates a Movie instance from a JSON object.
  factory Movie.fromJson(Map<String, dynamic> json) {
    // Return a new Movie instance with the given JSON properties.
    return Movie(
      title: json['title'] ?? '',
      posterUrl: json['posterUrl'] ?? '',
      year: json['year'] ?? 0,
      imdbRating: json['imdbRating'] ?? 0.0,
    );
  }

  // Converts this Movie instance to a JSON object.
  Map<String, dynamic> toJson() {
    // Return a JSON object with the Movie properties.
    return {
      'title': title,
      'posterUrl': posterUrl,
      'year': year,
      'imdbRating': imdbRating,
    };
  }
}