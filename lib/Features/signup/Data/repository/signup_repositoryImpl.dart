
import '../../Domain/entities/signup_entity.dart';
import '../data_sources/remote dataSource/signup_dataSource.dart';
import '../../Domain/repository/signup_repository.dart';

class signUpRepositoryImpl implements signUpRepository {
  final signupRemoteDataSource remoteDataSource;

  signUpRepositoryImpl(this.remoteDataSource);

  @override
  Future<SignupEntity> signUp(String email, String password) async {
    final user = await remoteDataSource.signUp(email, password);
    return SignupEntity(id: user.id, email: user.email ?? '');
  }
}
