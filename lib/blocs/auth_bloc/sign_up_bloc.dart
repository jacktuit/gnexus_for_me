import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../data/apis/login_api/sign_up_api.dart';
import '../../utils/status_code/status_code.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(UserSignUpLoggedState()) {

    /// Send date to api for register
    on<UserSignUpSendDataEvent>((event, emit) async {
      emit(UserSignUpInitialState());
      try{
        final result = await SignUpRepository.getInstance().signUp(event.context, event.firstName, event.lastname, event.userName, event.emile, event.password);
        if(StatusCode.successStatusCode == 200){
          emit(UserSignUpCodeVerifiState());
        } else {
          emit(UserSignUpLoggedState());
        }
      } catch(e){
        emit(UserSignUpErrorState(message: e.toString()));
      }
    });
  }
}
