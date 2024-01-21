import 'package:flutter/material.dart';
import 'package:your_app_name/components/movie_card.dart';
import 'package:your_app_name/models/movie.dart';
import 'package:your_app_name/services/movie_service.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/states/app_state.dart';

class HomeScreen extends StatefulWidget {
  // Builds the home screen.

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // A ScrollController for listening to scroll events.
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Fetch initial top-rated movies.
    _fetchTopRatedMovies();
    
    // Listen for scroll events to implement lazy loading.
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _fetchTopRatedMovies() {
    // Use the MovieService to fetch top-rated movies.
    MovieService.fetchTopRatedMovies().then((List<Movie> movies) {
      // Update the app state with the fetched movies.
      context.read<AppState>().setTopRatedMovies(movies);
    });
  }

  void _onScroll() {
    // Check if the user has reached the bottom of the list.
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Fetch more movies when the user reaches the bottom.
      _fetchTopRatedMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Access the top-rated movies list from the app state.
    List<Movie> topRatedMovies = context.watch<AppState>().topRatedMovies;

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Movies'),
      ),
      body: topRatedMovies.isEmpty
          // If there are no top-rated movies, show a loading indicator.
          ? Center(
              child: CircularProgressIndicator(),
            )
          // If there are top-rated movies, show them in a list.
          : ListView.builder(
              // The number of items in the list.
              itemCount: topRatedMovies.length,
              // A callback that builds each item in the list.
              itemBuilder: (context, index) {
                // The current movie being built.
                Movie movie = topRatedMovies[index];
                // Return a movie card for the current movie.
                return MovieCard(movie: movie);
              },
            ),
    );
  }
}