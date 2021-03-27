part of 'pexelbloc_bloc.dart';

@immutable
abstract class PexelblocState extends Equatable {
  const PexelblocState();
}

class PexelInitial extends PexelblocState {
  const PexelInitial();
  @override
  List<Object> get props => [];
}

class PexelLoading extends PexelblocState {
  const PexelLoading();
  @override
  List<Object> get props => null;
}

class PexelLoaded extends PexelblocState {
  final PexelModel pexelModel;
  const PexelLoaded(this.pexelModel);
  @override
  List<Object> get props => [pexelModel];
}

class PexelError extends PexelblocState {
  final String error;
  const PexelError(this.error);
  @override
  List<Object> get props => [error];
}
