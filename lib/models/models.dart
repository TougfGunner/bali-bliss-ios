class Vendor {
  final String id;
  final String name;
  final String slug;
  final String category;
  final String location;
  final String? imageUrl;
  final double? rating;
  final String? tagline;
  final bool featured;

  const Vendor({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
    required this.location,
    this.imageUrl,
    this.rating,
    this.tagline,
    this.featured = false,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json['id']?.toString() ?? '',
        name: json['name'] ?? '',
        slug: json['slug'] ?? '',
        category: json['category'] ?? '',
        location: json['location'] ?? '',
        imageUrl: json['imageUrl'] ?? json['heroImage'],
        rating: (json['rating'] as num?)?.toDouble(),
        tagline: json['tagline'],
        featured: json['featured'] ?? false,
      );
}

class WeddingCollection {
  final String id;
  final String title;
  final String slug;
  final String location;
  final String? coverImage;
  final int photoCount;
  final String category;

  const WeddingCollection({
    required this.id,
    required this.title,
    required this.slug,
    required this.location,
    this.coverImage,
    required this.photoCount,
    required this.category,
  });
}

class Article {
  final String id;
  final String title;
  final String slug;
  final String? excerpt;
  final String? coverImage;
  final String category;
  final String? author;
  final DateTime? publishedAt;

  const Article({
    required this.id,
    required this.title,
    required this.slug,
    this.excerpt,
    this.coverImage,
    required this.category,
    this.author,
    this.publishedAt,
  });
}

class ChecklistItem {
  final String id;
  final String task;
  final bool done;
  final String? category;

  const ChecklistItem({
    required this.id,
    required this.task,
    required this.done,
    this.category,
  });

  ChecklistItem copyWith({bool? done}) =>
      ChecklistItem(id: id, task: task, done: done ?? this.done, category: category);
}
