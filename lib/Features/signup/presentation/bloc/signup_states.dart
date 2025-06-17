// SignupState.dart

import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String email;

  const SignupSuccess({required this.email});

  @override
  List<Object?> get props => [email];
}
class SignupFailure extends SignupState {
  final String message;

  const SignupFailure(this.message);

  @override
  List<Object?> get props => [message];
}
