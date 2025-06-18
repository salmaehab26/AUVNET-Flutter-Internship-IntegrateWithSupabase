import '../../../signup/Domain/entities/signup_entity.dart';
import '../../../signup/Domain/repository/signup_repository.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  final loginRepository repository;

  LoginUseCase(this.repository);

  Future<UserEntity>  execute(String email, String password) {
    return repository.login(email, password);
  }
}
