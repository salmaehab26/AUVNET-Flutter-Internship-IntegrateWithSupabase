
import '../entities/login_entity.dart';
import '../repository/login_repository.dart';

class LoginUseCase {
  final loginRepository repository;

  LoginUseCase(this.repository);

  Future<LoginEntity>  execute(String email, String password) {
    return repository.login(email, password);
  }
}
