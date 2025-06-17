// import 'package:supabase_flutter/supabase_flutter.dart';
//
// final supabase = Supabase.instance.client;
//
// Future<void> signUpUser(String email, String password) async {
//   try {
//     final AuthResponse response = await supabase.auth.signUp(
//       email: email,
//       password: password,
//     );
//
//     final user = response.user;
//     final session = response.session;
//
//     if (user != null) {
//       print("✅ Sign up successful!");
//     } else {
//       print("⚠️ User is null. Check email confirmation settings.");
//     }
//   } on AuthException catch (error) {
//     print("❌ Sign up failed: ${error.message}");
//   } catch (e) {
//     print("❌ Unknown error: $e");
//   }
// }
