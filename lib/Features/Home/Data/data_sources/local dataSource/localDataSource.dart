import 'package:auvnet_flutter_task/Features/Home/Data/model/RestaurantModel.dart';

import '../../../Domain/entities/restaurant_entity.dart';

abstract class RestaurantLocalDataSource {
  Future<void> saveRestaurants(List<RestaurantModel> restaurants);
  Future<List<RestaurantModel>> getCachedRestaurants();
}
