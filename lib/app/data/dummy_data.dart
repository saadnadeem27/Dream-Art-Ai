import 'models/artwork_model.dart';

class DummyData {
  static List<ArtworkModel> get galleryArtworks => [
        ArtworkModel(
          id: '1',
          prompt:
              'A majestic dragon soaring through a nebula filled with stars and cosmic dust, digital art style',
          imageUrl:
              'https://picsum.photos/800/600?random=1',
          style: 'Digital Art',
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          width: 1024,
          height: 768,
          isFavorite: true,
          isPublic: true,
          tags: ['dragon', 'space', 'fantasy'],
          likes: 142,
          userId: 'user1',
        ),
        ArtworkModel(
          id: '2',
          prompt:
              'A serene Japanese garden with cherry blossoms and a traditional wooden bridge, watercolor painting',
          imageUrl:
              'https://picsum.photos/800/600?random=2',
          style: 'Watercolor',
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          width: 768,
          height: 1024,
          isFavorite: false,
          isPublic: true,
          tags: ['japanese', 'garden', 'peaceful'],
          likes: 89,
          userId: 'user2',
        ),
        ArtworkModel(
          id: '3',
          prompt:
              'A cyberpunk cityscape at night with neon lights reflecting on wet streets',
          imageUrl:
              'https://picsum.photos/800/600?random=3',
          style: 'Cyberpunk',
          createdAt: DateTime.now().subtract(const Duration(hours: 8)),
          width: 1024,
          height: 576,
          isFavorite: true,
          isPublic: true,
          tags: ['cyberpunk', 'city', 'neon'],
          likes: 203,
          userId: 'user3',
        ),
        ArtworkModel(
          id: '4',
          prompt:
              'An ethereal forest spirit with glowing blue eyes surrounded by magical fireflies',
          imageUrl:
              'https://picsum.photos/800/600?random=4',
          style: 'Fantasy',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          width: 768,
          height: 1024,
          isFavorite: false,
          isPublic: true,
          tags: ['fantasy', 'spirit', 'magic'],
          likes: 156,
          userId: 'user4',
        ),
        ArtworkModel(
          id: '5',
          prompt:
              'A vintage portrait of a woman in 1920s fashion, oil painting style',
          imageUrl:
              'https://picsum.photos/800/600?random=5',
          style: 'Oil Painting',
          createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
          width: 512,
          height: 768,
          isFavorite: true,
          isPublic: true,
          tags: ['vintage', '1920s', 'portrait'],
          likes: 78,
          userId: 'user5',
        ),
        ArtworkModel(
          id: '6',
          prompt:
              'Abstract geometric patterns in vibrant colors inspired by Mondrian',
          imageUrl:
              'https://picsum.photos/800/600?random=6',
          style: 'Abstract',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
          width: 1024,
          height: 1024,
          isFavorite: false,
          isPublic: true,
          tags: ['abstract', 'geometric', 'colorful'],
          likes: 92,
          userId: 'user6',
        ),
      ];

  static List<ArtworkModel> get myLibrary => [
        ArtworkModel(
          id: 'my1',
          prompt: 'A cozy cabin in a snowy forest during winter twilight',
          imageUrl:
              'https://picsum.photos/800/600?random=7',
          style: 'Realistic',
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          width: 1024,
          height: 768,
          isFavorite: true,
          isPublic: false,
          tags: ['cabin', 'snow', 'winter'],
          likes: 0,
          userId: 'currentUser',
        ),
        ArtworkModel(
          id: 'my2',
          prompt: 'Anime-style character with purple hair in a magical forest',
          imageUrl:
              'https://picsum.photos/800/600?random=8',
          style: 'Anime',
          createdAt: DateTime.now().subtract(const Duration(hours: 4)),
          width: 768,
          height: 1024,
          isFavorite: false,
          isPublic: false,
          tags: ['anime', 'character', 'magic'],
          likes: 0,
          userId: 'currentUser',
        ),
        ArtworkModel(
          id: 'my3',
          prompt: 'Steampunk airship floating above Victorian London',
          imageUrl:
              'https://picsum.photos/800/600?random=9',
          style: 'Steampunk',
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
          width: 1024,
          height: 576,
          isFavorite: true,
          isPublic: true,
          tags: ['steampunk', 'airship', 'victorian'],
          likes: 34,
          userId: 'currentUser',
        ),
      ];

  static List<String> get trendingPrompts => [
        'A majestic phoenix rising from crystalline flames',
        'Underwater city with bioluminescent coral architecture',
        'Robot samurai in a field of electric cherry blossoms',
        'Gothic cathedral made entirely of ice and snow',
        'Floating islands connected by rainbow bridges',
        'Ancient library with books that glow in the dark',
        'Mechanical butterfly with clockwork wings',
        'Desert oasis with crystal clear water and palm trees',
        'Space whale swimming through a galaxy of stars',
        'Enchanted forest where trees have faces and eyes',
      ];

  static List<String> get recentPrompts => [
        'A cozy cabin in a snowy forest during winter twilight',
        'Anime-style character with purple hair in a magical forest',
        'Steampunk airship floating above Victorian London',
        'Cyberpunk street market with holographic vendors',
        'Watercolor painting of a mountain lake at sunset',
      ];

  static List<Map<String, dynamic>> get featuredArtists => [
        {
          'name': 'Alex Chen',
          'avatar':
              'https://picsum.photos/100/100?random=10',
          'followers': 12500,
          'artworks': 234,
          'badge': 'Master Artist',
        },
        {
          'name': 'Maria Rodriguez',
          'avatar':
              'https://picsum.photos/100/100?random=11',
          'followers': 8900,
          'artworks': 156,
          'badge': 'Rising Star',
        },
        {
          'name': 'David Kim',
          'avatar':
              'https://picsum.photos/100/100?random=12',
          'followers': 15200,
          'artworks': 378,
          'badge': 'AI Pioneer',
        },
        {
          'name': 'Sarah Johnson',
          'avatar':
              'https://picsum.photos/100/100?random=13',
          'followers': 6700,
          'artworks': 98,
          'badge': 'Creative Mind',
        },
      ];

  static Map<String, dynamic> get userProfile => {
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'avatar':
            'https://picsum.photos/200/200?random=14',
        'isPremium': false,
        'joinDate': DateTime.now().subtract(const Duration(days: 30)),
        'artworksCreated': 23,
        'favoriteCount': 45,
        'followersCount': 156,
        'followingCount': 89,
        'bio':
            'Digital artist passionate about AI-generated art and creative expression.',
        'website': 'https://johndoe.art',
        'location': 'San Francisco, CA',
      };

  static List<Map<String, dynamic>> get notificationTypes => [
        {
          'title': 'New artwork generated',
          'subtitle': 'Your "Cyberpunk cityscape" is ready!',
          'time': '2 minutes ago',
          'type': 'generation',
          'isRead': false,
        },
        {
          'title': 'Someone liked your artwork',
          'subtitle': 'Alex Chen liked "Dragon in nebula"',
          'time': '1 hour ago',
          'type': 'like',
          'isRead': false,
        },
        {
          'title': 'Daily generation limit reset',
          'subtitle': 'You now have 5 new generations available',
          'time': '8 hours ago',
          'type': 'system',
          'isRead': true,
        },
        {
          'title': 'New follower',
          'subtitle': 'Maria Rodriguez started following you',
          'time': '1 day ago',
          'type': 'follow',
          'isRead': true,
        },
      ];
}
