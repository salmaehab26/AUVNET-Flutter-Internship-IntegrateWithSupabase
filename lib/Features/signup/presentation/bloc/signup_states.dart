
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_states.dart';

import '../../../../Core/utils/Failures.dart';
import '../../Domain/entities/signup_entity.dart';

enum SignUpRequestState { init, loading, success, error }

class SignupState {
  final SignUpRequestState signUpRequestState;
  final SignupEntity? signupModel;
  final Failures? failures;

  SignupState({
    this.signUpRequestState = SignUpRequestState.init,
    this.signupModel,
    this.failures,
  });

  SignupState copyWith({
    SignUpRequestState? signUpRequestState,
    SignupEntity? signupModel,
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
