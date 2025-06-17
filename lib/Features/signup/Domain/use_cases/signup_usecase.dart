
import '../repository/signup_repository.dart';
import '../entities/signup_entity.dart';

class SignUpUseCase {
  final signUpRepository repository;

  SignUpUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) {
    return repository.signUp(email, password);
  }
}
