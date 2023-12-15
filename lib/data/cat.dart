class Cat {
  final String id;
  final String url;
  final int width;
  final int height;

  const Cat({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'url': String url,
        'width': int width,
        'height': int height,
      } =>
        Cat(
          id: id,
          url: url,
          width: width,
          height: height,
        ),
      _ => throw const FormatException('Failed to load cat.'),
    };
  }
}
