import 'package:supabase_flutter/supabase_flutter.dart';

class loginRemoteDataSource {
  final SupabaseClient client;

  loginRemoteDataSource({required this.client});

  Future<void> login(String email, String password) async {
    final response = await client.auth.signInWithPassword(email: email, password: password);
    if (response.user == null) {
      throw Exception(response.session?.accessToken ?? "Login failed");
    }
  }
  //
  // Future<void> signUp(String email, String password) async {
  //   final response = await client.auth.signUp(email: email, password: password);
  //   if (response.user == null) {
  //     throw Exception(response.session?.accessToken ?? "Signup failed");
  //   }
  // }
}
