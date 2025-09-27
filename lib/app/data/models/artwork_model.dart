class ArtworkModel {
  final String id;
  final String prompt;
  final String imageUrl;
  final String style;
  final DateTime createdAt;
  final int width;
  final int height;
  final bool isFavorite;
  final bool isPublic;
  final List<String> tags;
  final int likes;
  final String userId;

  ArtworkModel({
    required this.id,
    required this.prompt,
    required this.imageUrl,
    required this.style,
    required this.createdAt,
    required this.width,
    required this.height,
    this.isFavorite = false,
    this.isPublic = false,
    this.tags = const [],
    this.likes = 0,
    required this.userId,
  });

  factory ArtworkModel.fromJson(Map<String, dynamic> json) {
    return ArtworkModel(
      id: json['id'] ?? '',
      prompt: json['prompt'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      style: json['style'] ?? '',
      createdAt:
          DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      width: json['width'] ?? 512,
      height: json['height'] ?? 512,
      isFavorite: json['isFavorite'] ?? false,
      isPublic: json['isPublic'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
      likes: json['likes'] ?? 0,
      userId: json['userId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prompt': prompt,
      'imageUrl': imageUrl,
      'style': style,
      'createdAt': createdAt.toIso8601String(),
      'width': width,
      'height': height,
      'isFavorite': isFavorite,
      'isPublic': isPublic,
      'tags': tags,
      'likes': likes,
      'userId': userId,
    };
  }

  ArtworkModel copyWith({
    String? id,
    String? prompt,
    String? imageUrl,
    String? style,
    DateTime? createdAt,
    int? width,
    int? height,
    bool? isFavorite,
    bool? isPublic,
    List<String>? tags,
    int? likes,
    String? userId,
  }) {
    return ArtworkModel(
      id: id ?? this.id,
      prompt: prompt ?? this.prompt,
      imageUrl: imageUrl ?? this.imageUrl,
      style: style ?? this.style,
      createdAt: createdAt ?? this.createdAt,
      width: width ?? this.width,
      height: height ?? this.height,
      isFavorite: isFavorite ?? this.isFavorite,
      isPublic: isPublic ?? this.isPublic,
      tags: tags ?? this.tags,
      likes: likes ?? this.likes,
      userId: userId ?? this.userId,
    );
  }
}
