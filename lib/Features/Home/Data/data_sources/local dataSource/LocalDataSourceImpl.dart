import 'package:auvnet_flutter_task/Features/Home/Data/model/RestaurantModel.dart';
import 'package:hive_flutter/adapters.dart';

import 'localDataSource.dart';

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  static const String _boxName = 'restaurants_box';

  @override
  Future<void> saveRestaurants(List<RestaurantModel> restaurants) async {
    final box = await Hive.openBox(_boxName);
    final data = restaurants.map((e) => e.toJson()).toList();
    await box.put('restaurants', data);
  }

  @override
  Future<List<RestaurantModel>> getCachedRestaurants() async {
    final box = await Hive.openBox(_boxName);
    final List<dynamic>? data = box.get('restaurants');

    if (data != null) {
      return data.map((e) => RestaurantModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      return [];
    }
  }
}
