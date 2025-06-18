// // import 'package:supabase_flutter/supabase_flutter.dart';
// //
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// import '../../Features/Home/Data/model/RestaurantModel.dart';
//
// class SupabaseStorageService {
//   bool isLoading = true;
//   List<RestaurantModel> restaurants = [];
//
//   Future<void> loadRestaurants() async {
//     try {
//       final data = await Supabase.instance.client.from('restaurants').select();
//       print("Data from Supabase: $data");
//       restaurants =
//           (data as List).map((item) => RestaurantModel.fromMap(item)).toList();
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
// //
// //
// // // Future<void> signUpUser(String email, String password) async {
// // //   try {
// // //     final AuthResponse response = await supabase.auth.signUp(
// // //       email: email,
// // //       password: password,
// // //     );
// // //
// // //     final user = response.user;
// // //     final session = response.session;
// // //
// // //     if (user != null) {
// // //       print("✅ Sign up successful!");
// // //     } else {
// // //       print("⚠️ User is null. Check email confirmation settings.");
// // //     }
// // //   } on AuthException catch (error) {
// // //     print("❌ Sign up failed: ${error.message}");
// // //   } catch (e) {
// // //     print("❌ Unknown error: $e");
// // //   }
// // // }
