import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final int id;
  final String title;
  final String body;

  const ListItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.body,
  })  : assert(id != null),
        assert(title != null),
        assert(body != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$id'),
      title: Text("$title"),
      contentPadding: EdgeInsets.all(12),
      subtitle: Text("$body"),
    );
  }
}
