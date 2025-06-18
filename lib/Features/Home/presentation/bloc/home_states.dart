import 'package:equatable/equatable.dart';

import '../../Domain/entities/restaurant_entity.dart';

class RestaurantState extends Equatable {
  final List<RestaurantEntity> restaurants;
  final bool isLoading;
  final String? error;

  const RestaurantState({
    this.restaurants = const [],
    this.isLoading = false,
    this.error,
  });

  RestaurantState copyWith({
    List<RestaurantEntity>? restaurants,
    bool? isLoading,
    String? error,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [restaurants, isLoading, error];
}
