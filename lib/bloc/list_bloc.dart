import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_list_try_myself/bloc/list_event.dart';
import 'package:infinity_list_try_myself/bloc/list_state.dart';
import 'package:infinity_list_try_myself/repos/list_repos.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentStateInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent commentEvent) async* {
    // Comment event trigger
    if (commentEvent is CommentEventFetchedComment && !_hasRechedEnd(state)) {
      try {
        switch (state.runtimeType) {
          case CommentStateInitial:
            yield CommentStateSuccess(
                hasReachedEnd: false,
                comments: await fetchCommentFromAPI(0, 20));
            break;
          case CommentStateSuccess:
            final comments = await fetchCommentFromAPI(
                (state as CommentStateSuccess).comments.length, 20);

            if (comments.isEmpty) {
              yield (state as CommentStateSuccess)
                  .copyWith(hasReachedEnd: true);
            } else {
              yield CommentStateSuccess(
                  hasReachedEnd: false,
                  comments: (state as CommentStateSuccess).comments + comments);
            }
            break;
        }
      } catch (_) {
        yield CommentStateFailure();
      }
    }
  }

  bool _hasRechedEnd(CommentState state) =>
      (state is CommentStateSuccess) && (state.hasReachedEnd);
}
