import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_accessories_ecommerce/trash/consts/constant_texts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(UnAuthenticated());
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //start the authentication stream to update ui based on it
  void startAuthenticationStream() {
    firebaseAuth.userChanges().listen((firebaseUser) {
      if (firebaseUser != null) {
        emit(Authenticated(firebaseUser: firebaseUser!));
      } else {
        emit(UnAuthenticated());
      }
    }, onError: (e) {
      emit(AuthenticationError(message: "error_message"));
    });
  }

  Future<bool> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(Authenticating());
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
      // print(userCredential.user);
      // print("printed here");
      // //already the stream emits authenticated state
      // emit(Authenticated(firebaseUser: userCredential.user!));
    } on FirebaseAuthException catch (e) {
      print(e);

      emit(AuthenticationError(
          message: e.message ?? ConstantTexts.errorMessage));
    } catch (e) {
      emit(AuthenticationError());
    }
    return false;
  }

  Future<bool> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(Authenticating());
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      //already the stream emits authenticated state
      return true;
      // emit(Authenticated(firebaseUser: userCredential.user!));
    } on FirebaseAuthException catch (e) {
      emit(AuthenticationError(
          message: e.message ?? ConstantTexts.errorMessage));
    } catch (e) {
      emit(AuthenticationError());
    }
    return false;
  }
}
