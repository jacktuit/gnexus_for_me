part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState  extends Equatable{}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}
class UserSignUpInitialState extends SignUpState{
  @override
  List<Object?> get props => [];

}

class UserSignUpLoggedState extends SignUpState{
  @override
  List<Object?> get props => [];
}
class UserSignUpCodeVerifiState extends SignUpState {
  @override
  List<Object?> get props => [];

}
class UserSignUpErrorState extends SignUpState {
  final String message;
  UserSignUpErrorState({required this.message});
  @override
  List<Object?> get props =>[message];

}