import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pick_up_event.dart';
part 'pick_up_state.dart';

class PickUpBloc extends Bloc<PickUpEvent, PickUpState> {
  PickUpBloc() : super(PickUpInitial()) {
    on<PickUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
