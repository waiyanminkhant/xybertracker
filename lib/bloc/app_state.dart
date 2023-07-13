part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final bool isLoading;
  final bool successful;
  const AppState({required this.isLoading, required this.successful});
}

class AppStateLoggedIn extends AppState {
  AppStateLoggedIn({required isLoading, required sucessful})
      : super(isLoading: isLoading, successful: sucessful);

  @override
  List<Object?> get props => [isLoading, successful];
}

class AppStateLoggedOut extends AppState {
  AppStateLoggedOut({required isLoading, required sucessful})
      : super(isLoading: isLoading, successful: sucessful);

  @override
  List<Object?> get props => [isLoading, successful];
}
