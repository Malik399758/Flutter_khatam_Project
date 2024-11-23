import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urraan_hive_database_p/hive_database_p/qaza_nimza_categories/qaza_nimaz.dart';
import 'package:urraan_hive_database_p/hive_database_p/quran_tilawat_categories/quran_tilawat_home_screen.dart';
import 'package:urraan_hive_database_p/hive_database_p/theme_categories/setting_screen.dart';
import 'package:urraan_hive_database_p/hive_database_p/theme_categories/theme_notifier.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, (MaterialPageRoute(builder: (_) => SettingScreen())));
            },
              child: Icon(Icons.more_horiz,size: 30,)),
        )],
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text('CATEGORIES',style: TextStyle(
                  fontSize: 25,fontWeight: FontWeight.bold
                ),)),
                SizedBox(height: 50,),
                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, (MaterialPageRoute(builder: (_) => ItemListScreen())));
                    },
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.green,
                      color:themeNotifier.isDarkTheme ? Colors.white : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(child: Text('Surat Yaseen',style:
                          TextStyle(color:themeNotifier.isDarkTheme ? Colors.black : Colors.white),)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, (MaterialPageRoute(builder: (_) => QazaNimaz())));
                    },
                    child: Card(
                      shadowColor: Colors.green,
                      elevation: 2,
                      color: themeNotifier.isDarkTheme ? Colors.white : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(child: Text('Qaza Nimaz',style:
                          TextStyle(color: themeNotifier.isDarkTheme ? Colors.black : Colors.white),)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, (MaterialPageRoute(builder: (_) => QuranTilawatHomeScreen())));
                    },
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.green,
                      color: themeNotifier.isDarkTheme ? Colors.white : Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(child: Text('Quran Tilawat',style:
                          TextStyle(color: themeNotifier.isDarkTheme ? Colors.black : Colors.white),)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
