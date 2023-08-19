part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState extends Equatable{}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class UserSignInInitialState extends SignInState{
  @override
  List<Object?> get props => [];

}

class UserSignInLoggedState extends SignInState{
  @override
  List<Object?> get props => [];
}
class UserSignInChakecdState extends SignInState {
  ProfileModel profileModelInfo;
  UserSignInChakecdState({required this.profileModelInfo});
  @override
  List<Object?> get props => [profileModelInfo];

}
class UserSignInErrorState extends SignInState {
  final String message;
  UserSignInErrorState({required this.message});
  @override
  List<Object?> get props =>[message];

}