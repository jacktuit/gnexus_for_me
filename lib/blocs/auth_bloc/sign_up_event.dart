part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {}

class UserSignUpSendDataEvent extends SignUpEvent {
  final BuildContext context;
  final String firstName;
  final String lastname;
  final String userName;
  final String emile;
  final String password;
  UserSignUpSendDataEvent(
      {required this.context,
      required this.firstName,
      required this.lastname,
      required this.userName,
      required this.emile,
      required this.password});
  @override
  List<Object?> get props =>
      [context, firstName, lastname, userName, emile, password];
}
