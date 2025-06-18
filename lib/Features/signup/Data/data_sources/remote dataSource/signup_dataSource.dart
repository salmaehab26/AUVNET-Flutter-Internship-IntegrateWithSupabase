// data/datasource/auth_remote_datasource.dart
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../Core/supabase/supabase_manager.dart';

class signupRemoteDataSource {
  SupabaseService supabaseService;

  signupRemoteDataSource({required this.supabaseService});

  Future<User> signUp(String email, String password) async

  {
    return await supabaseService.signUp(email, password);
  }
}
