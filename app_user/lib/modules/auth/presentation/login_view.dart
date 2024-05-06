import 'package:app_user/modules/auth/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        create: (context) => LoginCubit(),
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
