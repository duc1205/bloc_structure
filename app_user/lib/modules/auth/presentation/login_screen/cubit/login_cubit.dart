import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/login_usecase.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit({
    required this.loginUseCase,
  }) : super(const _Initial());

  Future<void> handleLogin() async {
    emit(_Loading());
    final repsonse = await loginUseCase.login();
    repsonse.fold(
      (l) => debugPrint('Login Error'),
      (r) {
        debugPrint('Login Success');
        emit(_Success());
      },
    );
  }
}
