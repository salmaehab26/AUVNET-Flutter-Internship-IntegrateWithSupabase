import '../../Domain/entities/restaurant_entity.dart';
import '../../Domain/repository/restaurant_Repository.dart';
import '../data_sources/local dataSource/localDataSource.dart';
import '../data_sources/remoteDataSource/RestaurantRemoteDataSource.dart';
import '../model/RestaurantModel.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;
  final RestaurantLocalDataSource localDataSource;

  RestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final restaurants = await remoteDataSource.getRestaurants();
      await localDataSource.saveRestaurants(restaurants);
      return restaurants;
    } catch (e) {
      return await localDataSource.getCachedRestaurants();
    }
  }
}
