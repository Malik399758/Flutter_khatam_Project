import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urraan_hive_database_p/hive_database_p/yaseen_Categories/item_list_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration (seconds: 5), (){
      Navigator.pushReplacement(context, (MaterialPageRoute(builder: (_) => ItemListScreen())));
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage('assets/images/yaseen_splash.png'),
            ),
            SizedBox(height: 30,),
            SpinKitFadingCircle(
              size: 30,
              color: Colors.white,
            )

          ],
        ),
      ),
    );
  }
}
