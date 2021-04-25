import 'package:hive/hive.dart';
  part 'vehiclemodel.g.dart';

@HiveType(typeId: 0)
class Vehicle {
  @HiveField(0)
  final String vehicleNumber;
  @HiveField(1)
  final String make;
  @HiveField(2)
  final String model;
  @HiveField(3)
  final String fuel;
  @HiveField(4)
  final String transmission;
  Vehicle(
      {this.vehicleNumber,
      this.make,
      this.model,
      this.fuel,
      this.transmission});
}
