import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/vehiclemodel.dart';

class HomeModel with ChangeNotifier {
  String _vehicleBox = 'vehicle';
  List _vehicleList = <Vehicle>[];
  List get vehicleList => _vehicleList;

  addItem(Vehicle vehicle) async {
    var box = await Hive.openBox<Vehicle>(_vehicleBox);
    box.add(vehicle);
    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<Vehicle>(_vehicleBox);
    _vehicleList = box.values.toList();
    notifyListeners();
  }

  updateItem(int index, Vehicle vehicle) {
    final box = Hive.box<Vehicle>(_vehicleBox);
    box.putAt(index, vehicle);
    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<Vehicle>(_vehicleBox);
    box.deleteAt(index);
    getItem();
    notifyListeners();
  }
}
