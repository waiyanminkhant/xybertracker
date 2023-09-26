import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xybertracker/auth/auth.dart';
import 'package:xybertracker/auth/auth_error.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppStateLoggedOut(isLoading: false, sucessful: false)) {
    on<AppEventLogin>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, sucessful: false));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, sucessful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, sucessful: false));
      }
    });

    on<AppEventLogout>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, sucessful: false));
      try {
        await Auth().signOut();
        emit(AppStateLoggedOut(isLoading: false, sucessful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    });

    on<AppEventRegister>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, sucessful: false));
      try {
        await Auth().createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(AppStateLoggedIn(isLoading: false, sucessful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, sucessful: false));
      }
    });

    on<AppEventResetPassword>((event, emit) async {
      emit(AppStateLoggedOut(isLoading: true, sucessful: false));
      try {
        await Auth().sendResetPswAndEmail(email: event.email);
        emit(AppStateLoggedIn(isLoading: false, sucessful: true));
      } on FirebaseAuthException catch (e) {
        print(e);
        authErrorLogin = e.toString();
        emit(AppStateLoggedOut(isLoading: false, sucessful: false));
      }
    });
  }
}
