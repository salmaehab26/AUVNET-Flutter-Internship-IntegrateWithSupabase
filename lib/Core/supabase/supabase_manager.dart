// lib/Core/services/supabase_service.dart

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient client;

  SupabaseService({required this.client});

   Future<User> signUp(String email, String password) async {
    final response = await client.auth.signUp(email: email, password: password);

    if (response.user == null) {
      throw Exception('Signup failed');
    }
    return response.user!;
  }

  Future<User>  login(String email, String password) async {
    final AuthResponse response = await client.auth.signInWithPassword(email: email, password: password);
    final Session? session = response.session;
    final User? user = response.user;
    if (user == null) {
      throw Exception(session?.accessToken ?? "Login failed");
    }
    return user;
  }


  Future<void> signOut() async {
    await client.auth.signOut();
  }



}
