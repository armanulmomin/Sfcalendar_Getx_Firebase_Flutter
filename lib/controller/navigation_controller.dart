import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
 final poneTitle="".obs;
  final poneStartDate = "".obs;
 final poneEndDate= "".obs;


  final ptwoTitle="".obs;
  final ptwoStartDate = "".obs;
  final ptwoEndDate = "".obs;

    final ponetitlefire = "".obs;
    final ponestartfire="".obs;
    final poneendfire = "".obs;

  final ptwotitlefire = "".obs;
  final ptwostartfire="".obs;
  final ptwoendfire = "".obs;




  void changeIndex(int index) {
    selectedIndex.value = index;
    /*print(index);
   // try {


      //print("------");
     // print(selectedIndex);
   // }
   // catch (e) {
   //   print("error");
  //  }

     */
  }
}
