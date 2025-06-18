import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Domain/use_cases/restaurants_UseCase.dart';
import 'home_events.dart';
import 'home_states.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final GetRestaurantsUseCase getRestaurantsUseCase;

  RestaurantBloc(this.getRestaurantsUseCase) : super(const RestaurantState()) {
    on<LoadRestaurantsEvent>(_onLoadRestaurants);
  }

  Future<void> _onLoadRestaurants(
      LoadRestaurantsEvent event, Emitter<RestaurantState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final restaurants = await getRestaurantsUseCase.call();
      emit(state.copyWith(
        isLoading: false,
        restaurants: restaurants,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}
