import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sfcalendar_getx_flutter/view/person_one.dart';
import 'package:sfcalendar_getx_flutter/view/person_two.dart';

import '../controller/navigation_controller.dart';
import 'home.dart';
class NavigationPage extends StatefulWidget {
   NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final screens = [PersonOne(), Home(), PersonTwo() ];
  NavigationController navigationController = Get.put(NavigationController());
  //int index=0;
  @override
  Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         centerTitle: true,
         automaticallyImplyLeading: false,
         title: Text("Event Schedule"),),

      body: Obx(() =>
         IndexedStack(
          index: navigationController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            navigationController.changeIndex(index);
          },
          currentIndex: navigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Person 1",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Person 2",
                backgroundColor: Colors.red),
          ],
        ),
      ),
    );
  }
}
