import 'package:bloc/bloc.dart';
import '../../domain/use_cases/login_useCase.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        final user = await loginUseCase.execute(event.email, event.password);
        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(  message: e.toString(),));
      }
    });
  }
}
