import '../../../signup/Domain/entities/signup_entity.dart';

abstract class loginRepository {
  Future<UserEntity> login(String email, String password);
}
