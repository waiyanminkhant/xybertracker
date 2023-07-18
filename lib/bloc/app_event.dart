part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

@immutable
class AppEventRegister extends AppEvent {
  final String email;
  final String password;

  const AppEventRegister({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AppEventLogin extends AppEvent {
  final String email;
  final String password;

  const AppEventLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AppEventResetPassword extends AppEvent {
  final String email;

  const AppEventResetPassword({required this.email});

  @override
  List<Object?> get props => [email];
}

@immutable
class AppEventLogout extends AppEvent {
  const AppEventLogout();

  @override
  List<Object?> get props => throw UnimplementedError();
}
