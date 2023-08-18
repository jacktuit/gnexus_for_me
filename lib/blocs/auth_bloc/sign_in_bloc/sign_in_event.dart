part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class UserSignInSendDataEvent extends SignInEvent {
  final String emile;
  final String password;
  final BuildContext context;
  UserSignInSendDataEvent(
      {required this.emile, required this.password, required this.context});
  @override
  List<Object?> get props => [emile, password, context];
}
