import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../Core/supabase/supabase_manager.dart';
import '../../../../signup/Domain/entities/signup_entity.dart';

class loginRemoteDataSource {
  final SupabaseService supabaseService;

  loginRemoteDataSource({required this.supabaseService});

  Future<User>  login(String email, String password) async {

    return supabaseService.login(email, password);
  }
}
