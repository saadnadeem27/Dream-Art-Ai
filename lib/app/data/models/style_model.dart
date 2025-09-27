class StyleModel {
  final String id;
  final String name;
  final String description;
  final String previewUrl;
  final bool isPremium;
  final String category;
  final List<String> tags;

  StyleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.previewUrl,
    this.isPremium = false,
    required this.category,
    this.tags = const [],
  });

  factory StyleModel.fromJson(Map<String, dynamic> json) {
    return StyleModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      previewUrl: json['previewUrl'] ?? '',
      isPremium: json['isPremium'] ?? false,
      category: json['category'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'previewUrl': previewUrl,
      'isPremium': isPremium,
      'category': category,
      'tags': tags,
    };
  }
}

// Static data for styles
class StyleData {
  static List<StyleModel> get allStyles => [
        StyleModel(
          id: 'realistic',
          name: 'Realistic',
          description: 'Photo-realistic AI generated images',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Photography',
          tags: ['realistic', 'photo', 'detailed'],
        ),
        StyleModel(
          id: 'anime',
          name: 'Anime',
          description: 'Japanese animation style artwork',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Animation',
          tags: ['anime', 'manga', 'japanese'],
        ),
        StyleModel(
          id: 'watercolor',
          name: 'Watercolor',
          description: 'Soft, flowing watercolor painting style',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Painting',
          tags: ['watercolor', 'soft', 'artistic'],
        ),
        StyleModel(
          id: 'oil_painting',
          name: 'Oil Painting',
          description: 'Classical oil painting technique',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Painting',
          tags: ['oil', 'classical', 'painting'],
        ),
        StyleModel(
          id: 'digital_art',
          name: 'Digital Art',
          description: 'Modern digital artwork style',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Digital',
          tags: ['digital', 'modern', 'art'],
        ),
        StyleModel(
          id: 'sketch',
          name: 'Sketch',
          description: 'Hand-drawn sketch style',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Drawing',
          tags: ['sketch', 'drawing', 'pencil'],
        ),
        StyleModel(
          id: 'abstract',
          name: 'Abstract',
          description: 'Abstract artistic interpretation',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Abstract',
          tags: ['abstract', 'artistic', 'creative'],
        ),
        StyleModel(
          id: 'surreal',
          name: 'Surreal',
          description: 'Surrealistic dream-like imagery',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Surreal',
          tags: ['surreal', 'dream', 'fantasy'],
          isPremium: true,
        ),
        StyleModel(
          id: 'cyberpunk',
          name: 'Cyberpunk',
          description: 'Futuristic cyberpunk aesthetic',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Futuristic',
          tags: ['cyberpunk', 'futuristic', 'neon'],
          isPremium: true,
        ),
        StyleModel(
          id: 'vintage',
          name: 'Vintage',
          description: 'Retro vintage style artwork',
          previewUrl:
              'https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=400',
          category: 'Vintage',
          tags: ['vintage', 'retro', 'old'],
        ),
      ];

  static List<String> get categories => [
        'All',
        'Photography',
        'Animation',
        'Painting',
        'Digital',
        'Drawing',
        'Abstract',
        'Surreal',
        'Futuristic',
        'Vintage',
      ];
}
