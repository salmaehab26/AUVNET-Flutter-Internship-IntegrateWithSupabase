// data/datasource/auth_remote_datasource.dart
import 'package:supabase_flutter/supabase_flutter.dart';

class signupRemoteDataSource {
  final SupabaseClient client;

  signupRemoteDataSource({required this.client});

  Future<User> signUp(String email, String password) async {
    final response = await client.auth.signUp(email: email, password: password);

    if (response.user == null) {
      throw Exception('Signup failed');
    }
    return response.user!;
  }
}
