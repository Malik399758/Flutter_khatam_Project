import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/item_box.dart';
import '../../services/item_model.dart';

class Isha extends StatefulWidget {
  const Isha({super.key});

  @override
  State<Isha> createState() => _IshaState();
}

class _IshaState extends State<Isha> {
  final hiveBox = HiveBoxManager();
  List<Item> ishaList = [];
  String formattedDateTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ishaFetch();
  }

  // fetch zuhr
  void _ishaFetch() async{
    List<Item> data = await hiveBox.ishaFetch();
    setState(() {
      ishaList = data;
    });
  }

  // add zuhr

  void _ishaAdd(String name) async{
    DateTime now = DateTime.now();
    formattedDateTime = DateFormat().format(now);
    hiveBox.ishaAdd(name,formattedDateTime);
    _ishaFetch();
  }

  // delete

  void _ishaDelete(int index) async{
    hiveBox.ishaDelete(index);
    _ishaFetch();

  }

  // Clear all record

  void _ishaClearAll() async{
    await hiveBox.ishaClearAll();
    _ishaFetch();
  }

  // Fiqr Dialog box
  Future<void> ishaDeleteDialog(BuildContext context, int index){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Delete Zuhr Qaza') ,
            content:Text('Do you want to delete this Isha Qaza Nimza?') ,
            actions: [
              ElevatedButton(onPressed: (){
                _ishaDelete(index);
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
  Future<void> ishaClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Clear All') ,
            content:Text('Do you want to Clear all Isha Qaza') ,
            actions: [
              ElevatedButton(onPressed: (){
                _ishaClearAll();
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
  Future<void> ishaNoRecordClearDialog(BuildContext context,){
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
                  if(ishaList.isNotEmpty){
                    ishaClearDialog(context);
                  }else{
                    ishaNoRecordClearDialog(context);
                  }

                },
                child: Text('Clear',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.red),)),)
        ],
        title: Text('Isha Qaza Nimza',style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body:ListView.builder(
        itemCount: ishaList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                title: Text(ishaList[index].title),
                subtitle: Text(ishaList[index].dateTime),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        ishaDeleteDialog(context,index);
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
      onPressed: (){
        _ishaAdd('Qaza Isha ${ishaList.length +1}');
      },
      child: Icon(Icons.add,color: Colors.white,),
    ),
    );
  }
}
