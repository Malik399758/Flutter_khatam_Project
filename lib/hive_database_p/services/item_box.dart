import 'package:hive_flutter/hive_flutter.dart';

import 'item_model.dart';
class HiveBoxManager{

  // Box Names
  final String boxName = 'KhaTamList';
  final String fiqrName = 'fiqrList';
  final String zuhrName = 'zuhrList';
  final String asrName = 'asrList';
  final String magribName = 'magribList';
  final String ishaName = 'ishaList';
  final String paraName = 'paraList';
  final String suratName = 'suratList';
  final String rukuName = 'rukuList';
  final String ayatName = 'ayatList';


  // Box variable
  Box<Item>? _box;
  Box<Item>? _fiqrBox;
  Box<Item>? _zuhrBox;
  Box<Item>? _asrBox;
  Box<Item>? _magribBox;
  Box<Item>? _ishaBox;
  Box<Item>? _paraBox;
  Box<Item>? _suratBox;
  Box<Item>? _rukuBox;
  Box<Item>? _ayatBox;

  // Box of List Yaseen Khatam
  Future<Box<Item>?> getData() async{
    if(_box == null){
      _box = await Hive.openBox(boxName);
    }
    return _box;
  }

  // AddRecord

 void addRecord(String name)async{
    final box = await getData();
    final addRecord = Item(title: name);
    await box?.add(addRecord);
 }

 // DeleteRecord

  void deleteRecord(int index) async{
    final box = await getData();
    await box!.deleteAt(index);

  }

 // Fetch Record

  Future<List<Item>?> fetchRecord() async{
    final box = await getData();
    return box?.values.toList();
 }

 // Box of Fiqr prayer Qaza

 Future<Box<Item>> fiqrData() async{
    if(_fiqrBox == null){
      _fiqrBox = await Hive.openBox(fiqrName);
    }
    return _fiqrBox!;
 }

 void fiqrAdd(String name,String DateTime) async{
    final box = await fiqrData();
   await box.add(Item(title: name,dateTime: DateTime));
 }

 // Delete
  void fiqrDelete(int index) async{
    final box = await fiqrData();
    await box.deleteAt(index);
  }

  // all clear record

  Future<void> fiqrAllClear() async{
    final box = await fiqrData();
    await box.clear();
  }

 Future<List<Item>> fetchFiqrRecord() async{
    final box = await fiqrData();
    return box.values.toList();
 }

 // For Zuhr
 Future<Box<Item>?> zuhrData() async{
    if(_zuhrBox == null){
      _zuhrBox = await Hive.openBox(zuhrName);
    }
    return _zuhrBox!;
 }

 // add
 void zuhrAdd(String name,String DateTime) async{
    final box = await zuhrData();
    await box?.add(Item(title: name,dateTime: DateTime));
 }

 // delete

 void zuhrDelete(int index) async{
    final box = await zuhrData();
    await box!.deleteAt(index);
 }

 // Clear all

 Future<void> zuhrClearAll() async{
    final box = await zuhrData();
    await box!.clear();
 }

 // fetch All

 Future<List<Item>> zuhrFetch() async{
    final box = await zuhrData();
    return box!.values.toList();
 }

 // Now for Asr

  Future<Box<Item>?> asrData() async{
    if(_asrBox == null){
      _asrBox = await Hive.openBox(asrName);
    }
    return _asrBox!;
  }

  // add
  void asrAdd(String name,String DateTime) async{
    final box = await asrData();
    await box?.add(Item(title: name,dateTime: DateTime));
  }

  // delete

  void asrDelete(int index) async{
    final box = await asrData();
    await box!.deleteAt(index);
  }

  // Clear all

  Future<void> asrClearAll() async{
    final box = await asrData();
    await box!.clear();
  }

  // fetch All

  Future<List<Item>> asrFetch() async{
    final box = await asrData();
    return box!.values.toList();
  }


  // Now for Magrib

  Future<Box<Item>?> magribData() async{
    if(_magribBox == null){
      _magribBox = await Hive.openBox(magribName);
    }
    return _magribBox!;
  }

  // add
  void magribAdd(String name,String DateTime) async{
    final box = await magribData();
    await box?.add(Item(title: name,dateTime: DateTime));
  }

  // delete

  void magribDelete(int index) async{
    final box = await magribData();
    await box!.deleteAt(index);
  }

  // Clear all

  Future<void> magribClearAll() async{
    final box = await magribData();
    await box!.clear();
  }

  // fetch All

  Future<List<Item>> magribFetch() async{
    final box = await magribData();
    return box!.values.toList();
  }

  // Now for Isha

  Future<Box<Item>?> ishaData() async{
    if(_ishaBox == null){
      _ishaBox = await Hive.openBox(ishaName);
    }
    return _ishaBox!;
  }

  // add
  void ishaAdd(String name,String DateTime) async{
    final box = await ishaData();
    await box?.add(Item(title: name,dateTime: DateTime));
  }

  // delete

  void ishaDelete(int index) async{
    final box = await ishaData();
    await box!.deleteAt(index);
  }

  // Clear all

  Future<void> ishaClearAll() async{
    final box = await ishaData();
    await box!.clear();
  }

  // fetch All

  Future<List<Item>> ishaFetch() async{
    final box = await ishaData();
    return box!.values.toList();
  }


  // ====================================================
   // Quran Tilawat Categories Box
 // ======================================================

 Future<Box<Item>?> paraData() async{
    if(_paraBox == null){
      _paraBox = await Hive.openBox(paraName);
    }
    return _paraBox;
 }

 // Add

 Future<void> paraAdd(String name) async{
    final box = await paraData();
    box!.add(Item(title: name));
 }

 Future<List<Item>> paraFetch() async{
    final box = await paraData();
    return box!.values.toList();
 }

 /// ==================== For Quran Surat Box ===================================

  Future<Box<Item>?> SuratData() async{
    if(_suratBox == null){
      _suratBox = await Hive.openBox(suratName);
    }
    return _suratBox;
  }

  // Add

  Future<void> suratAdd(String name) async{
    final box = await SuratData();
    box!.add(Item(title: name));
  }

  Future<List<Item>> suratFetch() async{
    final box = await SuratData();
    return box!.values.toList();
  }

  // =================== For Ruku box ==========================================

  Future<Box<Item>?> rukuData() async{
    if(_rukuBox == null){
      _rukuBox = await Hive.openBox(rukuName);
    }
    return _rukuBox;
  }

  // Add

  Future<void> rukuAdd(String name) async{
    final box = await rukuData();
    box!.add(Item(title: name));
  }

  Future<List<Item>> rukuFetch() async{
    final box = await rukuData();
    return box!.values.toList();
  }

  // ====================== Now for Ayat =====================================


  Future<Box<Item>?> ayatData() async{
    if(_ayatBox == null){
      _ayatBox = await Hive.openBox(ayatName);
    }
    return _ayatBox;
  }

  // Add

  Future<void> ayatAdd(String name) async{
    final box = await ayatData();
    box!.add(Item(title: name));
  }

  Future<List<Item>> ayatFetch() async{
    final box = await ayatData();
    return box!.values.toList();
  }















} // end of class