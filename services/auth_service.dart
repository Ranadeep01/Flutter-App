class AuthService {
  static const String baseUrl = '';

  // Log in a user and return the JWT token.
  Future<String?> login(String username, String password) async {
    try {
      // Make a login API request and obtain the JWT token
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String? token = data['token'];
        return token;
      } else {
        // Handle error cases
        return null;
      }
    } catch (error) {
      // Handle network or other errors
      return null;
    }
  }

  // Log out a user (if applicable in the authentication system).
  Future<void> logout(String token) async {
    try {
      // Make a logout API request (if applicable in your authentication system)
      // You may need to invalidate the token on the server side
    } catch (error) {
      // Handle network or other errors
    }
  }

  // Register a new user.
  Future<bool> register(String username, String phoneNumber, String email, String password) async {
    try {
      // Make a registration API request
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: {
          'username': username,
          'phoneNumber': phoneNumber,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Registration successful
        return true;
      } else {
        // Handle error cases
        return false;
      }
    } catch (error) {
      // Handle network or other errors
      return false;
    }
  }
}