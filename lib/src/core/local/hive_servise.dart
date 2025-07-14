
// import 'package:hive_flutter/hive_flutter.dart';

// class Service {
// final String  _boxName = "purchase";

// Future<Box<PurchaseModel>> get _box async =>
//       await Hive.openBox<PurchaseModel>(_boxName);

// //create
//   Future<void> addPerson(PurchaseModel personModel) async {
//     var box = await _box;
//     await box.add(personModel);
//   }

// //read
//   Future<List<PurchaseModel>> getAllPerson() async {
//     var box = await _box;
//     return box.values.toList();
//   }

// //update
//   Future<void> updateDeck(int index, PurchaseModel personModel) async { 
//     var box = await _box;
//     await box.putAt(index, personModel);
//   }

// //delete
//   Future<void> deletePerson(int index) async {
//     var box = await _box;
//     await box.deleteAt(index);
//   }
// }