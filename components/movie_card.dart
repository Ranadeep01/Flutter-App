//displays a Card with movie details (stateless widget)

import 'package:flutter/material.dart';
import 'package:your_app_name/models/movie.dart';

class MovieCard extends StatelessWidget {
  // A required constructor that takes in a Movie object.
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: ListTile(
        // Display the movie poster using an Image.network widget.
        leading: Image.network(
          movie.posterUrl,
          width: 50,
          height: 70,
          fit: BoxFit.cover,
        ),
        // Display the movie title.
        title: Text(movie.title),
        // Display the movie year and IMDB rating.
        subtitle: Text('${movie.year} | IMDB: ${movie.imdbRating}'),
        // Add an onTap callback to handle user interaction.
        onTap: () {
          // Navigate to movie details screen or handle the interaction
          // Example: Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetailsScreen(movie: movie)));
        },
      ),
    );
  }
}