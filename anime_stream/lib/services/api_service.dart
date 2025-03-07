import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.example.com'; // Replace with actual API URL

  // Fetch anime list
  Future<List<Map<String, dynamic>>> getAnimeList() async {
    try {
      // Simulated API response since we don't have a real backend
      await Future.delayed(const Duration(seconds: 1));
      return [
        {
          'id': '1',
          'title': 'One Piece',
          'imageUrl': 'https://cdn.myanimelist.net/images/anime/6/73245.jpg',
          'description': 'Follow Monkey D. Luffy and his pirate crew in their search for the ultimate treasure, the One Piece.',
          'episodes': '1000+ Episodes',
          'rating': 4.8,
        },
        {
          'id': '2',
          'title': 'Demon Slayer',
          'imageUrl': 'https://cdn.myanimelist.net/images/anime/1286/99889.jpg',
          'description': 'Tanjiro becomes a demon slayer to cure his sister and fight against demons.',
          'episodes': '26 Episodes',
          'rating': 4.9,
        },
        // Add more anime entries as needed
      ];

      // Real API implementation would look like this:
      // final response = await http.get(Uri.parse('$baseUrl/anime'));
      // if (response.statusCode == 200) {
      //   return List<Map<String, dynamic>>.from(json.decode(response.body));
      // } else {
      //   throw Exception('Failed to load anime list');
      // }
    } catch (e) {
      throw Exception('Failed to fetch anime list: $e');
    }
  }

  // Fetch anime details by ID
  Future<Map<String, dynamic>> getAnimeDetails(String id) async {
    try {
      // Simulated API response
      await Future.delayed(const Duration(seconds: 1));
      return {
        'id': id,
        'title': 'One Piece',
        'imageUrl': 'https://cdn.myanimelist.net/images/anime/6/73245.jpg',
        'description': 'Follow Monkey D. Luffy and his pirate crew in their search for the ultimate treasure, the One Piece.',
        'episodes': '1000+ Episodes',
        'rating': 4.8,
        'genres': ['Action', 'Adventure', 'Comedy'],
        'status': 'Ongoing',
        'streamUrl': 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      };

      // Real API implementation:
      // final response = await http.get(Uri.parse('$baseUrl/anime/$id'));
      // if (response.statusCode == 200) {
      //   return json.decode(response.body);
      // } else {
      //   throw Exception('Failed to load anime details');
      // }
    } catch (e) {
      throw Exception('Failed to fetch anime details: $e');
    }
  }

  // Authentication
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      // Simulated API response
      await Future.delayed(const Duration(seconds: 1));
      
      if (username.isNotEmpty && password.isNotEmpty) {
        return {
          'token': 'dummy_jwt_token',
          'user': {
            'id': '1',
            'username': username,
            'email': '$username@example.com',
          }
        };
      } else {
        throw Exception('Invalid credentials');
      }

      // Real API implementation:
      // final response = await http.post(
      //   Uri.parse('$baseUrl/auth/login'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode({
      //     'username': username,
      //     'password': password,
      //   }),
      // );
      // if (response.statusCode == 200) {
      //   return json.decode(response.body);
      // } else {
      //   throw Exception('Failed to login');
      // }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // Search anime
  Future<List<Map<String, dynamic>>> searchAnime(String query) async {
    try {
      // Simulated API response
      await Future.delayed(const Duration(seconds: 1));
      return [
        {
          'id': '1',
          'title': 'One Piece',
          'imageUrl': 'https://cdn.myanimelist.net/images/anime/6/73245.jpg',
          'description': 'Follow Monkey D. Luffy and his pirate crew in their search for the ultimate treasure, the One Piece.',
          'episodes': '1000+ Episodes',
        },
      ];

      // Real API implementation:
      // final response = await http.get(Uri.parse('$baseUrl/anime/search?q=$query'));
      // if (response.statusCode == 200) {
      //   return List<Map<String, dynamic>>.from(json.decode(response.body));
      // } else {
      //   throw Exception('Failed to search anime');
      // }
    } catch (e) {
      throw Exception('Search failed: $e');
    }
  }
}
