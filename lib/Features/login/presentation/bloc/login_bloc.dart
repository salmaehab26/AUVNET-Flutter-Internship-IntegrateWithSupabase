import 'package:auvnet_flutter_task/Features/login/Domain/use_cases/login_useCase.dart';
import 'package:bloc/bloc.dart';
import '../../../../Core/utils/Failures.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(loginRequestState: LoginRequestState.loading));

    try {
      final user = await loginUseCase.execute(event.email, event.password); // AuthModel

      emit(state.copyWith(
        loginRequestState: LoginRequestState.success,
       userModel: user,
      ));
    } catch (e) {
      emit(state.copyWith(
        loginRequestState: LoginRequestState.error,
        failures: e is Failures ? e : Failures(message: e.toString()),
      ));
    }
  }
}
