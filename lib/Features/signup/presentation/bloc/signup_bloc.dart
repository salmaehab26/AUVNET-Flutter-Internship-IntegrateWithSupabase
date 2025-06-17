import 'package:auvnet_flutter_task/Features/signup/Domain/repository/signup_repository.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_events.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/bloc/signup_states.dart';
import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Data/data_sources/remote dataSource/signup_dataSource.dart';
import '../../Data/repository/signup_repositoryImpl.dart';
import '../../Domain/use_cases/signup_usecase.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;

  SignupBloc()
      : signUpUseCase = SignUpUseCase(
   signUpRepositoryImpl(
      signupRemoteDataSource(client: Supabase.instance.client),
    ),
  ),
        super(SignupInitial()) {
    on<SignupButtonPressed>(_onSignupPressed);
  }

  Future<void> _onSignupPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(SignupLoading());
    try {
      final user = await signUpUseCase.execute(event.email, event.password);
      emit(SignupSuccess(email: user.email));
    } catch (e) {
      emit(SignupFailure( e.toString()));
    }
  }
}
