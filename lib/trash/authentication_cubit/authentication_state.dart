// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_cubit.dart';

@immutable
class AuthenticationState {}

class UnAuthenticated extends AuthenticationState {}

class Authenticating extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError({
    this.message = ConstantTexts.errorMessage,
  });
}

class Authenticated extends AuthenticationState {
  final User firebaseUser;
  Authenticated({
    required this.firebaseUser,
  });
}
