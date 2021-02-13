import 'dart:convert';
import 'package:infinity_list_try_myself/models/list_cell_model.dart';
import 'package:http/http.dart' as http;

Future<List<ListCell>> fetchCommentFromAPI(int startIndex, int limit) async {
  final url =
      'https://jsonplaceholder.typicode.com/comments?_start=$startIndex&_limit=$limit';
  final httpClient = http.Client();

  try {
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      print('==> FetchComment: {start: $startIndex, limit: $limit }');
      return (json.decode(response.body) as List)
          .map((rawComment) => ListCell(
              id: rawComment['id'],
              title: rawComment['email'],
              body: rawComment['body']))
          .toList();
    } else {
      return List<ListCell>();
    }
  } catch (_) {
    return List<ListCell>();
  }
}
