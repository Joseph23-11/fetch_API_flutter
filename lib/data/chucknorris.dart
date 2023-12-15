class ChuckNorris {
  final String id;
  final String value;
  final String iconUrl;

  const ChuckNorris({
    required this.id,
    required this.value,
    required this.iconUrl,
  });

  factory ChuckNorris.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'value': String value,
        'iconUrl': String iconUrl,
      } =>
        ChuckNorris(
          id: id,
          value: value,
          iconUrl: iconUrl,
        ),
      _ => throw const FormatException('Failed to load chu.'),
    };
  }
}
