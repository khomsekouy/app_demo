part of 'validator_form_bloc.dart';

abstract class ValidatorFormEvent extends Equatable {
  const ValidatorFormEvent();

}
class ValidatorEventFetch extends ValidatorFormEvent {
  ValidatorEventFetch(
      {required this.phoneNumber,
      required this.otp,
      required this.password,
      required this.confirmPassword});

  final String phoneNumber;
  final String otp;
  final String password;
  final String confirmPassword;
  @override
  List<Object> get props => [phoneNumber, otp, password, confirmPassword];
}
