import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../app_router.dart';
import '../../authentication_cubit/authentication_cubit.dart';
import '../widgets/app_text_field_with_label.dart';
import '../widgets/custom_app_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool lock = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        // if (state is Authenticating) {
        //   EasyLoading.show(
        //       indicator: const CircularProgressIndicator(),
        //       status: "loading",
        //       maskType: EasyLoadingMaskType.black);
        // } else {
        //   EasyLoading.dismiss();
        // }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          minimum: const EdgeInsets.all(26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              34.height,
              Text("Sign In", style: Theme.of(context).textTheme.headlineLarge!
                  //.copyWith(color: Theme.of(context).primaryColor)

                  ),
              34.height,
              AppTextFieldWithLabel(
                controller: emailController,
                textFieldType: TextFieldType.EMAIL_ENHANCED,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 18),
                  onTap: () {
                    BlocProvider.of<AuthenticationCubit>(context)
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) {
                      Navigator.pushNamedAndRemoveUntil(context, authWrapperUrl,
                          ModalRoute.withName(authWrapperUrl));
                    });
                  },
                  text: "Sign In"),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dont have account?",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: const Color(0xff909090)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, signUpScreenUrl);
                      },
                      child: Text(
                        "Sign up now",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Or",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                          elevation: 0),
                      onPressed: () {
                        // BlocProvider.of<AuthenticationCubit>(context)
                        //     .signInWithGoogleAccount();
                        // .then((value) =>
                        //     value == true ? Navigator.pop(context) : null);
                      },
                      child: Image.asset("")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
