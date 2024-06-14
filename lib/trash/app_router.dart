import 'package:car_accessories_ecommerce/trash/1_ui/screens/sign_in_screen.dart';
import 'package:car_accessories_ecommerce/trash/authentication_cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '1_ui/auth_wrapper.dart';
import '1_ui/screens/sign_up_screen.dart';

const String authWrapperUrl = "/";
const String signInScreenUrl = "signInScreenUrl";
const String signUpScreenUrl = "signUpScreenUrl";

class AppRouter {
  static Route? generateRoute(RouteSettings routeSettings) {
    final AuthenticationCubit _authenticationCubit = AuthenticationCubit();
    switch (routeSettings.name) {
      // case homePageUrl:
      //   return MaterialPageRoute(builder: (_) => const HomePage());

      case authWrapperUrl:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _authenticationCubit),

                    // BlocProvider.value(value: _getAppUserCubit)
                  ],
                  child: AuthWrapper(),
                ));

      case signInScreenUrl:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    // BlocProvider(
                    //   create: (context) => GeneralDataCubit(),
                    // ),
                    // BlocProvider(
                    //   create: (context) => InterstitialAdCubit(),
                    // ),
                    // BlocProvider(
                    //   create: (context) => BannerAdCubit(),
                    // ),
                    BlocProvider.value(value: _authenticationCubit)
                  ],
                  child: SignInScreen(),
                ));

      case signUpScreenUrl:
        // final List nameThenEmail = routeSettings.arguments as List;

        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: _authenticationCubit),
                    // BlocProvider(create: (context) => WriteAppuserCubit())
                  ],
                  //todo
                  child: SignUpScreen(),
                ));
    }
    return null;
  }
}
