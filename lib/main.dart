// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:urraan_hive_database_p/hive_database_p/home_screen/home_screen.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/item_box.dart';
import 'package:urraan_hive_database_p/hive_database_p/theme_categories/theme_notifier.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_notifier.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/splash_screen.dart';
import 'hive_database_p/yaseen_Categories/item_list_screen.dart';
import 'hive_database_p/services/item_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  var aa = HiveBoxManager();
  aa.getData();
  runApp(
      MultiProvider(
          providers: [
          ChangeNotifierProvider(create: (_) => ItemNotifier()),
          ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ],
        child: MyApp(),
      ),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: provider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade100,
        )
      ),

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
