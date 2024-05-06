import 'package:app_user/bindings/injector.dart';
import 'package:app_user/modules/auth/domain/usecases/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  Future<void> handleLogin() async {
    final loginUseCase = getIt<LoginUseCase>();

    final repsonse = await loginUseCase.run();
    repsonse.fold(
      (l) => debugPrint('Login Error'),
      (r) => debugPrint('Login Success'),
    );
  }
}
