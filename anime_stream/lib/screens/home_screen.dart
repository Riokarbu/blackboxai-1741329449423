import 'package:flutter/material.dart';
import '../widgets/background_widget.dart';

class AnimeCard {
  final String title;
  final String imageUrl;
  final String description;
  final String episodes;

  AnimeCard({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.episodes,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Dummy data for anime list
  final List<AnimeCard> animeList = const [
    AnimeCard(
      title: 'One Piece',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/6/73245.jpg',
      description: 'Follow Monkey D. Luffy and his pirate crew in their search for the ultimate treasure, the One Piece.',
      episodes: '1000+ Episodes',
    ),
    AnimeCard(
      title: 'Demon Slayer',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/1286/99889.jpg',
      description: 'Tanjiro becomes a demon slayer to cure his sister and fight against demons.',
      episodes: '26 Episodes',
    ),
    AnimeCard(
      title: 'Attack on Titan',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/10/47347.jpg',
      description: 'Humanity fights for survival against giant humanoid creatures called Titans.',
      episodes: '87 Episodes',
    ),
    AnimeCard(
      title: 'Jujutsu Kaisen',
      imageUrl: 'https://cdn.myanimelist.net/images/anime/1171/109222.jpg',
      description: 'A boy joins a high school for sorcerers to fight against cursed spirits.',
      episodes: '24 Episodes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Anime Stream',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        // TODO: Implement search functionality
                      },
                    ),
                  ],
                ),
              ),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildCategoryChip('All', true),
                    _buildCategoryChip('Popular', false),
                    _buildCategoryChip('New', false),
                    _buildCategoryChip('Movies', false),
                    _buildCategoryChip('Series', false),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Anime List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    final anime = animeList[index];
                    return _buildAnimeCard(context, anime);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.7),
          ),
        ),
        backgroundColor: isSelected ? Colors.purple : Colors.white.withOpacity(0.1),
      ),
    );
  }

  Widget _buildAnimeCard(BuildContext context, AnimeCard anime) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/streaming');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Anime Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.network(
                anime.imageUrl,
                width: 120,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 180,
                    color: Colors.grey,
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            // Anime Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      anime.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      anime.episodes,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700], size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
