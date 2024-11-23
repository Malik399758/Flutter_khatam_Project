import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_list_screen.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_notifier.dart';

import '../services/item_box.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final hiveBox = HiveBoxManager();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemNotifier>(context).getdata();
    return Scaffold(
      appBar: AppBar(
        title: Text('List Yaseen Khatam',style: TextStyle(
          fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Khatam name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                  onPressed: (){
                  final name = _nameController.text;
                  Provider.of<ItemNotifier>(context,listen: false).addRecords(name);
                  //Navigator.push(context, (MaterialPageRoute(builder: (_) => ItemListScreen())));
                  // _nameController.clear();
                 Navigator.pop(context,true);
                  },
                  child: Text('Add Record',style: TextStyle(
                    color: Colors.white
                  ),)),
            )
          ],
        ),
      ),
    );
  }
}
