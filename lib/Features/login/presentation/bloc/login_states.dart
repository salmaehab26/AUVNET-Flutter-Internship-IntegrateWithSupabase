

import '../../../../Core/Failures.dart';
import '../../../signup/Domain/entities/signup_entity.dart';

enum LoginRequestState {
  init,
  loading,
  success,
  error,
}

class LoginState {
  final LoginRequestState loginRequestState;
  final UserEntity? userModel;
  final Failures? failures;

  LoginState({
    this.loginRequestState = LoginRequestState.init,
    this.userModel,
    this.failures,
  });

  LoginState copyWith({
    LoginRequestState? loginRequestState,
    UserEntity? userModel,
    Failures? failures,
  }) {
    return LoginState(
      loginRequestState: loginRequestState ?? this.loginRequestState,
      userModel: userModel ?? this.userModel,
      failures: failures ?? this.failures,
    );
  }
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(loginRequestState: LoginRequestState.init);
}
