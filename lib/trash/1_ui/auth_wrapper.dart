import 'package:car_accessories_ecommerce/trash/1_ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication_cubit/authentication_cubit.dart';
import 'screens/home_screen.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});
  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    BlocProvider.of<AuthenticationCubit>(context).startAuthenticationStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated) {
          print("authenticated");
          return Scaffold(
            body: HomeScreen(),
          );
        } else {
          return SignInScreen();
        }
      },
    );
  }
}
