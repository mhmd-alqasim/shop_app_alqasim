abstract class AuthState {}

class InitialLoginState extends AuthState {}

class LoadingLoginState extends AuthState {}

class LoadingSignupState extends AuthState {}

class SuccssesLoginState extends AuthState {
  final String token;
  SuccssesLoginState(this.token);
}

class SuccssesSignupState extends AuthState {
  final String token;

  SuccssesSignupState(this.token);
}

class ErrorLoginState extends AuthState {}

class ErrorSignupState extends AuthState {
  // final String message;
  // ErrorSignupState(this.message);
}

class ChangPasswordIconVisibilityState extends AuthState {}
