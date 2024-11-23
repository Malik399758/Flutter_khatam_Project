
import 'package:flutter/foundation.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/item_box.dart';

import '../services/item_model.dart';

class ItemNotifier extends ChangeNotifier{
  final hiveBox = HiveBoxManager();
  List<Item> list = [];

  List<Item> getdata() => list;

  // Events
  // Fetch Record
  void fetchRecords() async {
    final data = await hiveBox.fetchRecord();
    list = data!;
    notifyListeners();


  }

  // Add Record
  void addRecords(String name) async {
    hiveBox.addRecord(name);
    notifyListeners();
  }

  void deleteRecords(int index) async {
    hiveBox.deleteRecord(index);
    notifyListeners();
  }


}