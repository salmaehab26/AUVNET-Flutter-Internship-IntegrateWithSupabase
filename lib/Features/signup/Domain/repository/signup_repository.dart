import '../entities/signup_entity.dart';

abstract class signUpRepository {
  Future<SignupEntity> signUp(String email, String password);
}
