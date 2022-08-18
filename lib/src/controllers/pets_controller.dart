import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../screens/adoption/adoption_model.dart';


class PetController with ChangeNotifier {

  final Box todoCache = Hive.box('pets');
  late String currentUser;
  List<Adoption> data = [];

  PetController(this.currentUser) {
    List result = todoCache.get(currentUser, defaultValue: []);
    print(result);
    for (var entry in result) {
      print(entry);
      data.add(Adoption.fromJson(Map<String, dynamic>.from(entry)));

    }
    notifyListeners();
  }


  addTodo(Adoption todo) {
    data.add(todo);
    saveDataToCache();
  }

  removeTodo(Adoption toBeDeleted) {
    data.remove(toBeDeleted);
    saveDataToCache();
  }

  updateTodo(Adoption todo, String newID, String newAge, String newGender, String newName, String newBreed) {
    todo.updateDetails(newID,newAge, newGender,  newName,  newBreed);

    saveDataToCache();
  }

  saveDataToCache() {
    List<Map<String, dynamic>> dataToStore = [];
    for (Adoption todo in data) {
      dataToStore.add(todo.toJson());
    }
    print(dataToStore);
    todoCache.put(currentUser, dataToStore);
    notifyListeners();
  }

}