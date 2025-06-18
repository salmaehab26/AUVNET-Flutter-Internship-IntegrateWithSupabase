
import '../../Domain/entities/login_entity.dart';
import '../../Domain/repository/login_repository.dart';
import '../data_sources/remote dataSource/login_dataSource.dart';

class LoginRepositoryImpl implements loginRepository {
  final loginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginEntity>  login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);

    return LoginEntity(id: user.id, email: user.email ?? '');
  }


}
