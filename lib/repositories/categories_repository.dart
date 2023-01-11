import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> categoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

Future<List<String>> fetchCategories() async {
  final url = Uri.parse("https://api.chucknorris.io/jokes/categories");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return categoriesFromJson(response.body);
  } else {
    throw Exception("Failed to fetch categories");
  }
}
