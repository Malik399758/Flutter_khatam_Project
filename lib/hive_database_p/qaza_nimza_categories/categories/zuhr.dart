import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urraan_hive_database_p/hive_database_p/services/item_box.dart';

import '../../services/item_model.dart';

class Zuhr extends StatefulWidget {
  const Zuhr({super.key});

  @override
  State<Zuhr> createState() => _ZuhrState();
}

class _ZuhrState extends State<Zuhr> {
  final hiveBox = HiveBoxManager();
  List<Item> zuhrList = [];
  String formattedDateTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _zuhrFetch();
  }

  // fetch zuhr
  void _zuhrFetch() async{
   List<Item> data = await hiveBox.zuhrFetch();
   setState(() {
     zuhrList = data;
   });
  }

  // add zuhr

  void _zuhrAdd(String name) async{
    DateTime now = DateTime.now();
    formattedDateTime = DateFormat().format(now);
    hiveBox.zuhrAdd(name,formattedDateTime);
    _zuhrFetch();
  }

  // delete

  void _zuhrDelete(int index) async{
    hiveBox.zuhrDelete(index);
    _zuhrFetch();

  }

  // Clear all record

  void _zuhrClearAll() async{
    await hiveBox.zuhrClearAll();
    _zuhrFetch();
  }

  // Fiqr Dialog box
  Future<void> zuhrDeleteDialog(BuildContext context, int index){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Delete Zuhr Qaza') ,
            content:Text('Do you want to delete this Fiqr Gaza Nimza?') ,
            actions: [
              ElevatedButton(onPressed: (){
                _zuhrDelete(index);
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
  Future<void> zuhrClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Clear All') ,
            content:Text('Do you want to Clear all firq Qaza') ,
            actions: [
              ElevatedButton(onPressed: (){
                _zuhrClearAll();
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
  Future<void> zuhrNoRecordClearDialog(BuildContext context,){
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
                  if(zuhrList.isNotEmpty){
                    zuhrClearDialog(context);
                  }else{
                    zuhrNoRecordClearDialog(context);
                  }

                },
                child: Text('Clear',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.red),)),)
        ],
        title: Text('Zuhr Qaza Nimza',style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body: Container(
        child: ListView.builder(
           itemCount: zuhrList.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  child: ListTile(
                    title: Text(zuhrList[index].title),
                    subtitle: Text(zuhrList[index].dateTime),
                    trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            zuhrDeleteDialog(context,index);
                          },
                          child: Icon(Icons.delete)),
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          _zuhrAdd('Qaza Zuhr ${zuhrList.length +1}');
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
