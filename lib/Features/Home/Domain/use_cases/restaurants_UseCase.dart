import '../entities/restaurant_entity.dart';
import '../repository/restaurant_Repository.dart';

class GetRestaurantsUseCase {
  final RestaurantRepository repository;

  GetRestaurantsUseCase(this.repository);

  Future<List<RestaurantEntity>> call() async {
    return await repository.getRestaurants();
  }
}
