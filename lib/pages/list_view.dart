import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_try_myself/bloc/list_bloc.dart';
import 'package:infinity_list_try_myself/bloc/list_event.dart';
import 'package:infinity_list_try_myself/bloc/list_state.dart';
import 'package:infinity_list_try_myself/widgets/bottom_loader.dart';
import 'package:infinity_list_try_myself/widgets/list_cell.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController;
  CommentBloc _commentBloc;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      if (maxScroll <= currentScroll) {
        _commentBloc.add(CommentEventFetchedComment());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _commentBloc.close();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _commentBloc = BlocProvider.of<CommentBloc>(context);

    return Scaffold(
      body: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, commentState) {
        Widget child;

        // Inital
        if (commentState is CommentStateInitial) {
          child = Center(
            child: CircularProgressIndicator(),
          );
        }

        if (commentState is CommentStateFailure) {
          child = Center(
            child: Text(
                "Fail to fetch data, please check your internet connection"),
          );
        }

        if (commentState is CommentStateSuccess) {
          child = ListView.builder(
              controller: _scrollController,
              itemCount: commentState.hasReachedEnd
                  ? commentState.comments.length
                  : commentState.comments.length + 1,
              itemBuilder: (context, index) {
                if (index + 1 > commentState.comments.length) {
                  return BottomCircleIndicator();
                }

                return ListItem(
                  body: commentState.comments[index].body,
                  id: commentState.comments[index].id,
                  title: commentState.comments[index].title,
                );
              });
        }

        return child;
      }),
    );
  }
}
