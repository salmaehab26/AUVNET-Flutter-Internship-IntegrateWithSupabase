
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_states.dart';

import '../../../../Core/Failures.dart';
import '../../Domain/entities/signup_entity.dart';

enum SignUpRequestState { init, loading, success, error }

class SignupState {
  final SignUpRequestState signUpRequestState;
  final UserEntity? signupModel;
  final Failures? failures;

  SignupState({
    this.signUpRequestState = SignUpRequestState.init,
    this.signupModel,
    this.failures,
  });

  SignupState copyWith({
    SignUpRequestState? signUpRequestState,
    UserEntity? signupModel,
    Failures? failures,
  }) {
    return SignupState(
      signUpRequestState: signUpRequestState ?? this.signUpRequestState,
      signupModel: signupModel ?? this.signupModel,
      failures: failures ?? this.failures,
    );
  }
}

final class SignupInitial extends SignupState {
  SignupInitial() : super(signUpRequestState: SignUpRequestState.init);
}
