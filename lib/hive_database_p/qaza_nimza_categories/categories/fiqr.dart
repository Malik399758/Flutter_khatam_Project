import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../services/item_box.dart';
import '../../services/item_model.dart';

class Fiqr extends StatefulWidget {
  const Fiqr({super.key});

  @override
  State<Fiqr> createState() => _FiqrState();
}

class _FiqrState extends State<Fiqr> {
  final hiveBox = HiveBoxManager();
  List<Item> list = [];
  String formattedDateTime = '';
  // bool selected = false;
  DateTime now = DateTime.now();


  @override
  void initState() {
    super.initState();
    _fetchFiqr();

  }
 /* void _toggleDateTime(){
    selected =!selected;
    setState(() {
    });

  }*/

  void _fetchFiqr() async{
    hiveBox.fiqrData();
    final data = await hiveBox.fetchFiqrRecord();
    setState(() {
      list = data!;
    });

  }

  void _addFiqr(String name,) async{

    formattedDateTime = DateFormat().format(now);
    hiveBox.fiqrAdd(name,formattedDateTime);
    _fetchFiqr();
  }

  // delete
  void _deleteFiqr(int index) async{
    hiveBox.fiqrDelete(index);
    _fetchFiqr();
  }
  
  // all record clear
  void _FiqrAllClear() async{
    await hiveBox.fiqrAllClear();
    _fetchFiqr();
  }

  // Fiqr Dialog box
  Future<void> fiqrDeleteDialog(BuildContext context, int index){
    return showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title:Text('Delete Fiqr Qaza') ,
        content:Text('Do you want to delete this Fiqr Gaza Nimza?') ,
        actions: [
         ElevatedButton(onPressed: (){
           _deleteFiqr(index);
           Navigator.pop(context);
         }, child:Text('Yes')),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('NO')),
        ],
      );
        });
  }

  // Clear Dialog box
  Future<void> fiqrClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Clear All') ,
            content:Text('Do you want to Clear all firq Qaza') ,
            actions: [
              ElevatedButton(onPressed: (){
                _FiqrAllClear();
                Navigator.pop(context);
              }, child:Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('NO')),
            ],
          );
        });
  }

  // No Data Exist
  Future<void> fiqrNoRecordClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Sorry') ,
            content:Text('Here, No Data Available till Now!!') ,
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Close')),
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: (){
                if(list.isNotEmpty){
                  fiqrClearDialog(context);
                }else{
                  fiqrNoRecordClearDialog(context);
                }

              },
              child: Text('Clear',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.red),)),)
          ],
        title: Text(
          'Fiqr Qaza Nimza',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                title: Text(list[index].title),
                subtitle: Text(list[index].dateTime),
                trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          fiqrDeleteDialog(context,index);
                        },
                          child: Icon(Icons.delete)),
                    ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          // Change to a valid string name for the Item
          _addFiqr('Qaza Fiqr ${list.length + 1}'); // Pass the name directly
        },
        child: Icon(CupertinoIcons.add, color: Colors.white),
      ),
    );
  }
}
