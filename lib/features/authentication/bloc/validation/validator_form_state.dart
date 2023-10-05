part of 'validator_form_bloc.dart';

abstract class ValidatorFormState extends Equatable {
  const ValidatorFormState();
}

class ValidatorFormInitial extends ValidatorFormState {
  @override
  List<Object> get props => [];
}
//check if the file is empty
class ValidatorFormLoading extends ValidatorFormState {
  @override
  List<Object> get props => [];
}
class ValidatorFormSuccess extends ValidatorFormState {
  ValidatorFormSuccess({required this.message});
  final String message;
  @override
  List<Object> get props => [];
}

class ValidatorFormFailure extends ValidatorFormState {
  ValidatorFormFailure({required this.message});
  final String message;
  @override
  List<Object> get props => [];
}
