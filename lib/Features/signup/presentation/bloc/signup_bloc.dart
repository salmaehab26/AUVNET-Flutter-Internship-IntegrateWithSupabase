import 'package:auvnet_flutter_task/Features/signup/Domain/use_cases/signup_usecase.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_events.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_states.dart';
import 'package:bloc/bloc.dart';

import '../../../../Core/Failures.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;


  SignupBloc(this.signUpUseCase) : super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  Future<void> _onSignupButtonPressed(
      SignupButtonPressed event,
      Emitter<SignupState> emit,
      ) async {
    emit(state.copyWith(signUpRequestState: SignUpRequestState.loading));

    try {
      final user = await signUpUseCase.execute(event.email, event.password);
      emit(state.copyWith(
        signUpRequestState: SignUpRequestState.success,
        signupModel: user,
      ));
    } catch (e) {
      emit(state.copyWith(
        signUpRequestState: SignUpRequestState.error,
        failures:Failures(message: e.toString()),
      ));
    }
  }
}
