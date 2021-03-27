import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:test123/bloc/postBloc/post_event.dart';
import 'package:test123/bloc/postBloc/post_state.dart';
import 'package:test123/models/sampleUserModel.dart';
import 'package:test123/services/api_service/repository/postRepository.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  PostBloc({@required this.httpClient}) : super(PostInitial());

  PostRepository postRepository = PostRepository();
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          List<SampleUserModel> listUsers = List<SampleUserModel>();
          await postRepository
              .fetchPost(0, 20)
              .then((value) => listUsers = value);
          print("==========> list user $listUsers");
          yield PostSuccess(listPosts: listUsers, heasReachedMax: false);
        }
        if (currentState is PostSuccess) {
          List<SampleUserModel> listUsers = List<SampleUserModel>();
          await postRepository
              .fetchPost(0, 20)
              .then((value) => listUsers = value);
          yield listUsers.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
                  listPosts: currentState.listPosts + listUsers,
                  heasReachedMax: false);
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.heasReachedMax;
}
