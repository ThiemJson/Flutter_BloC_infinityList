import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_try_myself/bloc/list_bloc.dart';
import 'package:infinity_list_try_myself/bloc/list_event.dart';
import 'package:infinity_list_try_myself/pages/list_view.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (BuildContext context) =>
            CommentBloc()..add(CommentEventFetchedComment()),
        child: ListPage(),
      ),
    );
  }
}
