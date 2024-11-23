import 'package:flutter/material.dart';
import 'package:urraan_hive_database_p/hive_database_p/theme_categories/theme_notifier.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/add_screen.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/item_box.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_notifier.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/qaza_nimaz.dart';
import 'detail_screen.dart';
import '../services/item_model.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  List<Item> list = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ItemNotifier>(context, listen: false).fetchRecords();
    });
  }

  Future<void> deleteShow(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Khatam'),
          content: const Text('Do you want to delete this khatam?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Provider.of<ItemNotifier>(context, listen: false).deleteRecords(index);
                Provider.of<ItemNotifier>(context, listen: false).fetchRecords();
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    var provider = Provider.of<ItemNotifier>(context).getdata();
    list = provider;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List Yaseen Khatam',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: ()async {
           final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => AddScreen()));
           if (result == true) {
             Provider.of<ItemNotifier>(context, listen: false).fetchRecords();
           }
            },
            icon: CircleAvatar(
              minRadius: 14,
              backgroundColor: themeNotifier.isDarkTheme ? Colors.white : Colors.black,
              child: Icon(Icons.add, color: themeNotifier.isDarkTheme ? Colors.black : Colors.white),
            ),
          ),
        ],
      ),
      body: list.isEmpty
          ? const Center(
        child: Text(
          'No Khatam Available yet!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      )
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(item: list[index], titleName: list[index].title)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                      list[index].title,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        deleteShow(context, index);
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
