import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drop_off_event.dart';
part 'drop_off_state.dart';

class DropOffBloc extends Bloc<DropOffEvent, DropOffState> {
  DropOffBloc() : super(DropOffInitial()) {
    on<DropOffEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
