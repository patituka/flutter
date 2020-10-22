class Picture {
  final String id;
  final int width;
  final int height;
  final String color;
  final int likes;
  final String description;
  final UnsplashUrl urls;

  Picture(
      {this.id,
      this.width,
      this.height,
      this.color,
      this.likes,
      this.description,
      this.urls});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      likes: json['likes'],
      description: json['description'],
      urls: UnsplashUrl.fromJson(json['urls'] as Map<String, dynamic>),
    );
  }
}

class UnsplashUrl {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  UnsplashUrl(this.raw, this.full, this.regular, this.small, this.thumb);

  factory UnsplashUrl.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return UnsplashUrl(json['raw'], json['full'], json['regular'],
          json['small'], json['thumb']);
    } else {
      return null;
    }
  }
}
