import 'package:flutter/material.dart';
import 'package:your_app_name/components/movie_card.dart';
import 'package:your_app_name/components/search_bar.dart';
import 'package:your_app_name/models/movie.dart';
import 'package:your_app_name/services/movie_service.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/states/app_state.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // A controller for the search bar.
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Clear the search query when the screen is initialized.
    _searchController.clear();
  }

  // A method for searching movies.
  void _searchMovies(String query) {
    MovieService.searchMovies(query).then((List<Movie> movies) {
      // Update the app state with the search results.
      context.read<AppState>().setSearchResults(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the search results from the app state.
    List<Movie> searchResults = context.watch<AppState>().searchResults;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Movies'),
      ),
      body: Column(
        children: [
          // The search bar.
          SearchBar(
            controller: _searchController,
            onSubmitted: _searchMovies,
          ),
          Expanded(
            // Fill the remaining space in the column.
            child: searchResults.isEmpty
                ? Center(
                    child: Text('No search results.'),
                  )
                : ListView.builder(
                    // Display a list of movie cards.
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      Movie movie = searchResults[index];
                      return MovieCard(movie: movie);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}