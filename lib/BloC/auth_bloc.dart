import 'package:alqasim_market/BloC/states/auth_states.dart';
import 'package:alqasim_market/models/login_model.dart';
import 'package:alqasim_market/models/signup_model.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/const/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(InitialLoginState());
  static AuthBloc get(context) => BlocProvider.of(context);
  late LoginModel loginModel;

  IconData suffix = Icons.visibility;
  bool ispassword = true;
  void changPasswordIconVisibility() {
    ispassword = !ispassword;
    suffix = ispassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangPasswordIconVisibilityState());
  }

  authLogin(String email, String password) {
    emit(LoadingLoginState());
    DioHelper.postData(url: login, data: {'email': email, 'password': password})
        .then((value) {
          loginModel = LoginModel.fromJson(value.data);

          if (loginModel.status!) {
            emit(SuccssesLoginState(loginModel.token.toString()));
          }
        })
        .catchError((e) {
          emit(ErrorLoginState());
        });
  }

  late SignUpModel signupModel;

  authSignup(String username, String email, String password) {
    emit(LoadingSignupState());
    DioHelper.postData(
          url: register,
          data: {'username': username, 'email': email, 'password': password},
        )
        .then((value) {
          signupModel = SignUpModel.fromJson(value.data);
          if (signupModel.status!) {
            emit(SuccssesSignupState(signupModel.data!.token.toString()));
          } else {
            // emit(ErrorSignupState(signupModel.message.toString()));
          }
        })
        .catchError((e) {
          emit(ErrorSignupState());
        });
  }
}
