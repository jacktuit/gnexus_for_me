
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../data/apis/login_api/sign_in_api.dart';
import '../../../data/models/login_model/sign_in_model.dart';
import '../../../utils/status_code/status_code.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(UserSignInLoggedState()) {
    on<UserSignInSendDataEvent>((event, emit) async {
      emit(UserSignInInitialState());
      try{
        final response = await LoginRepository.getInstance().login(event.emile, event.password);
        if(StatusCode.successStatusCode == 200){
          emit(UserSignInChakecdState(profileModelInfo: response));
        } else {
          emit(UserSignInLoggedState());
        }
      } catch(e){
        emit(UserSignInErrorState(message: e.toString()));
      }

    });
  }
}
