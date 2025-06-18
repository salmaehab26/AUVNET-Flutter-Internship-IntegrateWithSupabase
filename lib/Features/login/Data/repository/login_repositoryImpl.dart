import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../signup/Data/data_sources/remote dataSource/signup_dataSource.dart';
import '../../../signup/Domain/entities/signup_entity.dart';
import '../../../signup/Domain/repository/signup_repository.dart';
import '../../Domain/repository/login_repository.dart';
import '../data_sources/remote dataSource/login_dataSource.dart';

class LoginRepositoryImpl implements loginRepository {
  final loginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity>  login(String email, String password) async {
    final user = await remoteDataSource.login(email, password);

    return UserEntity(id: user.id, email: user.email ?? '');
  }


}
