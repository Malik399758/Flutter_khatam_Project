import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/item_box.dart';
import '../../services/item_model.dart';

class Asr extends StatefulWidget {
  const Asr({super.key});

  @override
  State<Asr> createState() => _AsrState();
}

class _AsrState extends State<Asr> {
  final hiveBox = HiveBoxManager();
  List<Item> asrList = [];
  String formattedDateTime = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _asrFetch();
  }

  // fetch zuhr
  void _asrFetch() async{
    List<Item> data = await hiveBox.asrFetch();
    setState(() {
      asrList = data;
    });
  }

  // add zuhr

  void _asrAdd(String name) async{
    DateTime now = DateTime.now();
    formattedDateTime = DateFormat().format(now);
    hiveBox.asrAdd(name,formattedDateTime);
    _asrFetch();
  }

  // delete

  void _asrDelete(int index) async{
    hiveBox.asrDelete(index);
    _asrFetch();

  }

  // Clear all record

  void _asrClearAll() async{
    await hiveBox.asrClearAll();
    _asrFetch();
  }

  // Fiqr Dialog box
  Future<void> asrDeleteDialog(BuildContext context, int index){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Delete Zuhr Qaza') ,
            content:Text('Do you want to delete this Asr Qaza Nimza?') ,
            actions: [
              ElevatedButton(onPressed: (){
                _asrDelete(index);
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
  Future<void> asrClearDialog(BuildContext context,){
    return showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title:Text('Clear All') ,
            content:Text('Do you want to Clear all Asr Qaza') ,
            actions: [
              ElevatedButton(onPressed: (){
                _asrClearAll();
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
  Future<void> asrNoRecordClearDialog(BuildContext context,){
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
                  if(asrList.isNotEmpty){
                    asrClearDialog(context);
                  }else{
                    asrNoRecordClearDialog(context);
                  }

                },
                child: Text('Clear',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.red),)),)
        ],
        title: Text('Asr Qaza Nimza',style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body:ListView.builder(
        itemCount: asrList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              child: ListTile(
                title: Text(asrList[index].title),
                subtitle: Text(asrList[index].dateTime),
                trailing: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        asrDeleteDialog(context,index);
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
          _asrAdd('Qaza Asr ${asrList.length + 1}');
        },
        child: Icon(CupertinoIcons.add, color: Colors.white),
      ),
    );
  }
}
