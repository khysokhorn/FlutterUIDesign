import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test123/models/pexelsModel/pexelsImageModel.dart';
import 'package:test123/repository/Repositorypexel.dart';

part 'pexelbloc_event.dart';
part 'pexelbloc_state.dart';

class PexelblocBloc extends Bloc<PexelblocEvent, PexelblocState> {
  PexelRepository _repository = PexelRepository();
  PexelblocBloc() : super(PexelInitial());
  String log = "========> bloc ";

  @override
  Stream<PexelblocState> mapEventToState(
    PexelblocEvent event,
  ) async* {
    print("$log");
    try {
      if (event is PexelblocEvent) {
        yield (PexelLoading());
        print("$log block wor as normal ");

        final pexelModel = await _repository.fetchImages();
        yield PexelLoaded(pexelModel);
      }
    } catch (e) {
      print("$log error with $e");
      yield (PexelError(e));
    }
  }
}
