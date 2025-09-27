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
              'https://picsum.photos/400/400?random=101',
          category: 'Photography',
          tags: ['realistic', 'photo', 'detailed'],
        ),
        StyleModel(
          id: 'anime',
          name: 'Anime',
          description: 'Japanese animation style artwork',
          previewUrl:
              'https://picsum.photos/400/400?random=102',
          category: 'Animation',
          tags: ['anime', 'manga', 'japanese'],
        ),
        StyleModel(
          id: 'watercolor',
          name: 'Watercolor',
          description: 'Soft, flowing watercolor painting style',
          previewUrl:
              'https://picsum.photos/400/400?random=103',
          category: 'Painting',
          tags: ['watercolor', 'soft', 'artistic'],
        ),
        StyleModel(
          id: 'oil_painting',
          name: 'Oil Painting',
          description: 'Classical oil painting technique',
          previewUrl:
              'https://picsum.photos/400/400?random=104',
          category: 'Painting',
          tags: ['oil', 'classical', 'painting'],
        ),
        StyleModel(
          id: 'digital_art',
          name: 'Digital Art',
          description: 'Modern digital artwork style',
          previewUrl:
              'https://picsum.photos/400/400?random=105',
          category: 'Digital',
          tags: ['digital', 'modern', 'art'],
        ),
        StyleModel(
          id: 'sketch',
          name: 'Sketch',
          description: 'Hand-drawn sketch style',
          previewUrl:
              'https://picsum.photos/400/400?random=106',
          category: 'Drawing',
          tags: ['sketch', 'drawing', 'pencil'],
        ),
        StyleModel(
          id: 'abstract',
          name: 'Abstract',
          description: 'Abstract artistic interpretation',
          previewUrl:
              'https://picsum.photos/400/400?random=107',
          category: 'Abstract',
          tags: ['abstract', 'artistic', 'creative'],
        ),
        StyleModel(
          id: 'surreal',
          name: 'Surreal',
          description: 'Surrealistic dream-like imagery',
          previewUrl:
              'https://picsum.photos/400/400?random=108',
          category: 'Surreal',
          tags: ['surreal', 'dream', 'fantasy'],
          isPremium: true,
        ),
        StyleModel(
          id: 'cyberpunk',
          name: 'Cyberpunk',
          description: 'Futuristic cyberpunk aesthetic',
          previewUrl:
              'https://picsum.photos/400/400?random=109',
          category: 'Futuristic',
          tags: ['cyberpunk', 'futuristic', 'neon'],
          isPremium: true,
        ),
        StyleModel(
          id: 'vintage',
          name: 'Vintage',
          description: 'Retro vintage style artwork',
          previewUrl:
              'https://picsum.photos/400/400?random=110',
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
