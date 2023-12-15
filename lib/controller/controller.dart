import 'dart:convert';

import 'package:flutter_application_1/data/album.dart';
import 'package:flutter_application_1/data/cat.dart';
import 'package:flutter_application_1/data/chucknorris.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> fetchAlbumList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  if (response.statusCode == 200) {
    final albums = jsonDecode(response.body);
    return (albums as List<dynamic>)
        .map((dynamic album) => Album.fromJson(album as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to Load List Album');
  }
}

Future<ChuckNorris> fetchChuckNorris() async {
  final response = await http.get(
    Uri.parse('https://api.chucknorris.io/jokes/random'),
  );

  if (response.statusCode == 200) {
    return ChuckNorris.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load chuck norris.');
  }
}

Future<List<Cat>> fetchRandomCat() async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/images/search'),
  );

  if (response.statusCode == 200) {
    final cats = jsonDecode(response.body);
    return (cats as List<dynamic>)
        .map((dynamic cat) => Cat.fromJson(cat as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load cat.');
  }
}

Future<List<Cat>> fetchListOfCat() async {
  final response = await http.get(
    Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10'),
  );

  if (response.statusCode == 200) {
    final cats = jsonDecode(response.body);
    return (cats as List<dynamic>)
        .map((dynamic cat) => Cat.fromJson(cat as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load cat.');
  }
}
