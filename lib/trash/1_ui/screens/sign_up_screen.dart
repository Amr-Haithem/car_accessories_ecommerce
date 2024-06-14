import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../authentication_cubit/authentication_cubit.dart';
import '../widgets/app_text_field_with_label.dart';
import '../widgets/custom_app_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    super.key,
  });
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            if (state is Authenticated) {
              //todo add new avatar
              // BlocProvider.of<WriteAppuserCubit>(context).writeAppUserToDB(
              //     isNewAppUser: true,
              //     docId: state.firebaseUser.uid,
              //     appUser: AppUser(
              //         id: state.firebaseUser.uid,
              //         dateTimeOfSigningUp: DateTime.now(),
              //         avatar: "avatar",
              //         email: email,
              //         name: name,
              //         kps: 0,
              //         winsCount: 0,
              //         bestKpsScore: 0,
              //         categoryIdToLastTriviaDocId: {},
              //         idOfLastQuote: null,
              //         idOfLastFunFact: null,
              //         idOfLastHistoricalCharacter: null,
              //         listOfChallengedUsers: []));
            }
          },
        ),
        // BlocListener<WriteAppuserCubit, WriteAppUserState>(
        //   listener: (context, state) {
        //     if (state is WriteAppUserLoaded) {
        //       Navigator.pushNamedAndRemoveUntil(
        //           context, authWrapperUrl, ModalRoute.withName(authWrapperUrl));
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          minimum: const EdgeInsets.all(26),
          child: Column(
            children: [
              const Row(
                children: [BackButton()],
              ),
              34.height,
              Column(
                children: [
                  Text("Sign Up",
                      style: Theme.of(context).textTheme.headlineLarge!
                      //.copyWith(color: Theme.of(context).primaryColor)

                      ),
                  34.height,
                  AppTextFieldWithLabel(
                    controller: emailController,
                    textFieldType: TextFieldType.EMAIL,
                    titleText: 'Email',
                  ),
                  18.height,
                  AppTextFieldWithLabel(
                    controller: passwordController,
                    textFieldType: TextFieldType.PASSWORD,
                    titleText: 'Password',
                  ),
                  32.height,
                  CustomAppButton(
                      isFilledButton: true,
                      borderRadius: 12,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 18),
                      onTap: () {
                        BlocProvider.of<AuthenticationCubit>(context)
                            .signUpWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                      },
                      text: "Sign Up"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
