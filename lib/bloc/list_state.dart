import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:infinity_list_try_myself/models/list_cell_model.dart';

class CommentState extends Equatable {
  const CommentState();
  @override
  List<Object> get props => [];
}

class CommentStateInitial extends CommentState {}

class CommentStateFailure extends CommentState {}

class CommentStateSuccess extends CommentState {
  final bool hasReachedEnd;
  final List<ListCell> comments;

  CommentStateSuccess({@required this.hasReachedEnd, @required this.comments})
      : assert(hasReachedEnd != null),
        assert(comments != null);

  CommentStateSuccess copyWith({bool hasReachedEnd, List<ListCell> comments}) =>
      CommentStateSuccess(
          hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
          comments: comments ?? this.comments);

  @override
  List<Object> get props => [hasReachedEnd, comments];

  @override
  String toString() =>
      'CommentStateSuccess: {hasReachedEnd: $hasReachedEnd, comments lenght: ${comments.length}}';
}
