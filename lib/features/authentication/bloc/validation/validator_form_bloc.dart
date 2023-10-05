
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';


part 'validator_form_event.dart';
part 'validator_form_state.dart';

const _duration = Duration(milliseconds: 500); // 500ms
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ValidatorFormBloc extends Bloc<ValidatorFormEvent, ValidatorFormState> {
  ValidatorFormBloc() : super(ValidatorFormInitial()) {
    on<ValidatorEventFetch>(_onValidator, transformer: debounce(_duration));
  }
  FutureOr<void> _onValidator(ValidatorEventFetch event,
      Emitter<ValidatorFormState> emit) async {
    emit(ValidatorFormLoading());
    try {
      await Future.delayed(_duration);
      emit(ValidatorFormSuccess(message: 'Success'));
    } catch (e) {
      emit(ValidatorFormFailure(message: e.toString()));
    }
  }
}
