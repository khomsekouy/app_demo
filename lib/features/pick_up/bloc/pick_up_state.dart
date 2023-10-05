part of 'pick_up_bloc.dart';

abstract class PickUpState extends Equatable {
  const PickUpState();
}

class PickUpInitial extends PickUpState {
  @override
  List<Object> get props => [];
}
