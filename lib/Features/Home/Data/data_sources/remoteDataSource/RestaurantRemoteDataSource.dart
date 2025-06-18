import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../Core/Failures.dart';
import '../../../Domain/entities/restaurant_entity.dart';
import '../../model/RestaurantModel.dart';

 class RestaurantRemoteDataSource {
  final SupabaseClient client;

  RestaurantRemoteDataSource({required this.client});

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await client.from('restaurants').select();

      final restaurants =
          (response as List)
              .map((item) => RestaurantModel.fromJson(item))
              .toList();

      return restaurants;
    } catch (e) {
      throw Failures(message: e.toString());
    }
  }
}
