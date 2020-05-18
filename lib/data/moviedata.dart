import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

Future<String> _loadMovieAsset() async {
  return await rootBundle.loadString('assets/data.JSON');
}

Future loadMovie() async {
  String jsonMovie = await _loadMovieAsset();
  print(jsonMovie);
  _parseJsonForMovie(jsonMovie);
}

void _parseJsonForMovie(String jsonString) {
  Map decoded = jsonDecode(jsonString);
  String title=decoded['Title'];
  String year=decoded['Year'];
  print(title);
  print(year);
}