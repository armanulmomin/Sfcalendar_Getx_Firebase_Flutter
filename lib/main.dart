import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sfcalendar_getx_flutter/view/navigation_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sfcalendar_getx_flutter/view/practice.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
          accentColor: Colors.white,

          primaryColor: Colors.red
      ),
     // home: NavigationPage(),

      home: NavigationPage(),
     // home: Practice(),
    );
  }
}


