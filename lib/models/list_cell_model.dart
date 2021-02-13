import 'package:flutter/widgets.dart';

class ListCell {
  final int id;
  final String title;
  final String body;

  ListCell({@required this.id, @required this.title, @required this.body})
      : assert(id != null),
        assert(title != null),
        assert(body != null);

  @override
  String toString() => 'Comment: {id: $id}';
}
