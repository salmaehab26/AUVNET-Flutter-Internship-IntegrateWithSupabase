import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../signup/Domain/entities/signup_entity.dart';

class loginRemoteDataSource {
  final SupabaseClient client;

  loginRemoteDataSource({required this.client});

  Future<User>  login(String email, String password) async {
    final AuthResponse response = await client.auth.signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
    final accessToken = response.session?.accessToken;
    final refreshToken = response.session?.refreshToken;
    if (user == null) {
      throw Exception(session?.accessToken ?? "Login failed");
    }
    return user;
  }
}
