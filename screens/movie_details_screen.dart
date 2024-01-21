import 'package:flutter/material.dart';
import 'package:your_app_name/models/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  // A screen for displaying movie details.

  final Movie movie;

  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar for the screen.
      appBar: AppBar(
        title: Text(movie.title),
      ),

      // The main content of the screen.
      body: Padding(
        // Add padding around the content.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Align the children along the cross axis.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the movie poster.
            Image.network(
              movie.posterUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Add vertical spacing between the movie details.
            SizedBox(height: 16),

            // Display the movie details.
            Text('Year: ${movie.year}'),
            SizedBox(height: 8),
            Text('IMDB Rating: ${movie.imdbRating}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}