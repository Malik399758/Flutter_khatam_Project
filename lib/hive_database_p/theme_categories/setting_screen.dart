import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urraan_hive_database_p/hive_database_p/theme_categories/theme_notifier.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings',style: TextStyle(
          fontSize: 18,fontWeight: FontWeight.w600
        ),),
      ),
      body: Container(
        child: ListTile(
          title: Text(provider.isDarkTheme ? 'Dark Theme' : 'Light Theme'),
          subtitle: Text('Change theme mode here'),
          trailing: Consumer<ThemeNotifier>(
            builder: (context,provider,child){
              return  Switch(
                activeColor: Colors.green,
                value: provider.isDarkTheme,
                onChanged: (bool value){
                  provider.toggleTheme(value);
                },
              );
            },

          )

        ),
      ),
    );
  }
}
