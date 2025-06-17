import '../entities/signup_entity.dart';

abstract class signUpRepository {
  Future<UserEntity> signUp(String email, String password);
}
