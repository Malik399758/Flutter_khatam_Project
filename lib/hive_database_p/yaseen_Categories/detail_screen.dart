/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:urraan_hive_database_p/hive_database_p/item_box.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<bool> isSelectedList = List.generate(20, (index) => false);
  String formattedDateTime = '';
  late Box selectionBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime now = DateTime.now();
    formattedDateTime = DateFormat().format(now);
    _initHiveBox();
  }
  Future<void> _initHiveBox() async {
    selectionBox = await Hive.openBox('selectionBox');

    // Load saved selections from Hive
    for (int i = 0; i < isSelectedList.length; i++) {
      isSelectedList[i] = selectionBox.get('item_$i', defaultValue: false);
    }
    setState(() {}); // Refresh UI after loading data
  }

  void _toggleButton(int index){
    isSelectedList[index] = !isSelectedList[index];
    selectionBox.put('item_$index', isSelectedList[index]);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Yaseen Khatam'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: isSelectedList.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  _toggleButton(index);
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(isSelectedList[index] ? formattedDateTime : 'No Selected'),
                      ),
                      Icon(isSelectedList[index] ? Icons.check : Icons.close,
                      color: isSelectedList[index] ? Colors.green : Colors.red,)
                    ],
                  ),
                ),
              );
            })
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../services/item_model.dart';

class DetailScreen extends StatefulWidget {
  final Item item;
  final String titleName;

  const DetailScreen({super.key, required this.item, required this.titleName});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<bool> isSelectedList = List.generate(41, (index) => false);
  List<String> selectionTimestamps = List.generate(41, (index) => '');
  late Box selectionBox;

  @override
  void initState() {
    super.initState();
    _initHiveBox();
  }

  Future<void> _initHiveBox() async {
    selectionBox = await Hive.openBox('selectionBox');

    // Load saved selections and timestamps from Hive
    for (int i = 0; i < isSelectedList.length; i++) {
      isSelectedList[i] = selectionBox.get('item_${widget.item.title}_$i', defaultValue: false);
      selectionTimestamps[i] = selectionBox.get('timestamp_${widget.item.title}_$i', defaultValue: '');
    }
    setState(() {});
  }

  void _toggleButton(int index) {
    setState(() {
      // Toggle the selected item without resetting other items
      isSelectedList[index] = !isSelectedList[index];

      // Set or clear the timestamp based on selection status
      if (isSelectedList[index]) {
        selectionTimestamps[index] = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      } else {
        selectionTimestamps[index] = '';
      }

      // Save both selection state and timestamp in Hive
      selectionBox.put('item_${widget.item.title}_$index', isSelectedList[index]);
      selectionBox.put('timestamp_${widget.item.title}_$index', selectionTimestamps[index]);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(widget.titleName),
      ),
      body: ListView.builder(
        itemCount: isSelectedList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _toggleButton(index);
            },
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text('${index+1}'),
                          SizedBox(width: 30,),
                          Text(
                            isSelectedList[index] ? selectionTimestamps[index] : 'No Selected',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      isSelectedList[index] ? Icons.check : Icons.close,
                      color: isSelectedList[index] ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
