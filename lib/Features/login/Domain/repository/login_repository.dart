import '../entities/login_entity.dart';

abstract class loginRepository {
  Future<LoginEntity> login(String email, String password);
}
