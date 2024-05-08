import 'package:app_user/modules/auth/presentation/login_screen/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bindings/injector.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          loginUseCase: getIt<LoginUseCase>(),
        ),
        child: Builder(builder: (context) {
          return Center(
            child: TextButton(
              onPressed: () => context.read<LoginCubit>().handleLogin(),
              child: const Text(
                'Click',
              ),
            ),
          );
        }),
      ),
    );
  }
}
