//This widget provides a text input for users to enter their search query

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  // A required TextEditingController that controls the text input.
  final TextEditingController controller;

  // A required callback that handles user input.
  final Function(String) onSubmitted;

  SearchBar({required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Add padding around the TextField.
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // Use the provided controller to control the text input.
        controller: controller,
        // Customize's the appearance of the text field.
        decoration: InputDecoration(
          // Displays a hint text.
          hintText: 'Search movies...',
          // Displays a search icon.
          prefixIcon: Icon(Icons.search),
          // Customize the border of the text field.
          border: OutlineInputBorder(
            // Round the corners of the border.
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Handle user input.
        onSubmitted: onSubmitted,
      ),
    );
  }
}