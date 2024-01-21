import 'package:flutter/material.dart';
import 'package:your_app_name/components/movie_card.dart';
import 'package:your_app_name/models/movie.dart';
import 'package:your_app_name/states/app_state.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  // Builds the favorites screen.

  @override
  Widget build(BuildContext context) {
    // Access the favorite movies list from the app state.
    List<Movie> favoriteMovies = context.read<AppState>().favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: favoriteMovies.isEmpty
          // If there are no favorite movies, show a message.
          ? Center(
              child: Text('No favorite movies yet.'),
            )
          // If there are favorite movies, show them in a list.
          : ListView.builder(
              // The number of items in the list.
              itemCount: favoriteMovies.length,
              // A callback that builds each item in the list.
              itemBuilder: (context, index) {
                // The current movie being built.
                Movie movie = favoriteMovies[index];
                // Return a movie card for the current movie.
                return MovieCard(movie: movie);
              },
            ),
    );
  }
}