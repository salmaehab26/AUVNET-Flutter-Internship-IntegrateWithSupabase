import 'package:auvnet_flutter_task/Features/Home/Domain/entities/restaurant_entity.dart';
import 'package:equatable/equatable.dart';

class RestaurantModel extends RestaurantEntity {
   RestaurantModel({
      required super.id,
    required super.name,
    required super.time,
    required super.image,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      time: json['time'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'time': time,
      'image': image,
    };
  }

  @override
  List<Object?> get props => [id, name, time, image];
}
