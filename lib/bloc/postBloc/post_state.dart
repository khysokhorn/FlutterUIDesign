import 'package:equatable/equatable.dart';
import 'package:test123/models/sampleUserModel.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

// tell presenter layer it need to render to load post
class PostInitial extends PostState {}

class PostFailure extends PostState {}

class PostSuccess extends PostState {
  final List<SampleUserModel> listPosts;
  final bool heasReachedMax;

  PostSuccess({
    this.listPosts,
    this.heasReachedMax,
  });

  PostSuccess copyWith({
    List<SampleUserModel> posts,
    bool hasReachedMax,
  }) {
    return PostSuccess(
      listPosts: posts ?? this.listPosts,
      heasReachedMax: heasReachedMax ?? this.heasReachedMax,
    );
  }

  @override
  List<Object> get props => [listPosts, heasReachedMax];

  @override
  String toString() {
 
    return "PostSucess{posts:${listPosts.length} , hasReachedMax: $heasReachedMax";
  }
}
