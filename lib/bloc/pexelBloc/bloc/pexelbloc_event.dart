part of 'pexelbloc_bloc.dart';

abstract class PexelblocEvent extends Equatable {
  const PexelblocEvent();
}

class GetPexelList extends PexelblocEvent {
  @override
  List<Object> get props => null;
}
