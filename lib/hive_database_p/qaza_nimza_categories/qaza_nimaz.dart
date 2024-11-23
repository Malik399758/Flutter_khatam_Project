import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/categories/asr.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/categories/fiqr.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/categories/isha.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/categories/mahrib.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/sub_list.dart';

import 'categories/zuhr.dart';

class QazaNimaz extends StatefulWidget {
  const QazaNimaz({super.key});

  @override
  State<QazaNimaz> createState() => _QazaNimazState();
}

class _QazaNimazState extends State<QazaNimaz> {
  List<bool> QazaSubList = List.generate(5, (index) => false);
  List<String> QazaList = [
    'Fiqr',
    'Zuhr',
    'Asr',
    'Maghrib',
    'Asha'
  ];
  // bool isSubSelected = false;

  void _QazaToggleList(int index){
    QazaSubList[index] = !QazaSubList[index];
    setState(() {
    });
  }

  void _navigateToCategory(int index) {
    Widget screen;

    // Determine which screen to navigate to based on the index
    switch (index) {
      case 0:
        screen = Fiqr(); // Navigate to Fiqr screen
        break;
      case 1:
        screen = Zuhr(); // Navigate to Zuhr screen
        break;
      case 2:
        screen = Asr();
      case 3:
        screen = Mahrib();
      case 4:
        screen = Isha();
    // Add cases for other Qaza types as needed
      default:
        screen = SubList(); // Fallback to a default screen if necessary
    }

    // Navigate to the selected screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Qaza Nimza' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount:QazaList.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        onTap: (){
                          _navigateToCategory(index);
                        },
                        child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(QazaList[index]),
                                  /*InkWell(
                                    onTap: (){
                                      _navigateToCategory(index);
                                    },
                                    child: const CircleAvatar(
                                      minRadius: 10,
                                      backgroundColor: Colors.black,
                                        child: Icon(CupertinoIcons.add,color: Colors.white,)),
                                  )*/
                                ],
                              )
                            )),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
