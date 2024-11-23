import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/item_box.dart';
import '../../services/item_model.dart';

class Mahrib extends StatefulWidget {
  const Mahrib({super.key});

  @override
  State<Mahrib> createState() => _MahribState();
}

class _MahribState extends State<Mahrib> {
  final hiveBox = HiveBoxManager();
  List<Item> magribList = [];
  String formattedDateTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _magribFetch();
  }

  // fetch zuhr
  void _magribFetch() async{
    List<Item> data = await hiveBox.magribFetch();
    setState(() {
      magribList = data;
    });
  }

  // add zuhr

  void _magribAdd(String name) async{
    DateTime now = DateTime.now();
    formattedDateTime = DateFormat().format(now);
    hiveBox.magribAdd(name,formattedDateTime);
    _magribFetch();
  }

  // delete

  void _magribDelete(int index) async{
    hiveBox.magribDelete(index);
    _magribFetch();

  }

  // Clear all record

  void _magribClearAll() async{
    await hiveBox.magribClearAll();
    _magribFetch();
  }

  // Fiqr Dialog box
  Future<void> magribDeleteDialog(BuildContext context, int index){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Delete Zuhr Qaza') ,
            content:Text('Do you want to delete this Magrib Qaza Nimza?') ,
            actions: [
              ElevatedButton(onPressed: (){
                _magribDelete(index);
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
  Future<void> magribClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Clear All') ,
            content:Text('Do you want to Clear all Magrib Qaza') ,
            actions: [
              ElevatedButton(onPressed: (){
                _magribClearAll();
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
  Future<void> magribNoRecordClearDialog(BuildContext context,){
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
                  if(magribList.isNotEmpty){
                    magribClearDialog(context);
                  }else{
                    magribNoRecordClearDialog(context);
                  }

                },
                child: Text('Clear',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.red),)),)
        ],
        title: Text('Mahrib Qaza Nimza',style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body: ListView.builder(
        itemCount: magribList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                title: Text(magribList[index].title),
                subtitle: Text(magribList[index].dateTime),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        magribDeleteDialog(context,index);
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
          _magribAdd('Qaza Magrib ${magribList.length + 1}');
        },
        child: Icon(CupertinoIcons.add, color: Colors.white),
      ),
    );
  }
}
