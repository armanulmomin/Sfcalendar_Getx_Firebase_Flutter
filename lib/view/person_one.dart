import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/navigation_controller.dart';
import '../model/meeting.dart';
import '../model/meeting_data_source.dart';

import 'details.dart';
import 'navigation_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:syncfusion_flutter_calendar/src/';
class PersonOne extends StatefulWidget {
  const PersonOne({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonOne> createState() => _PersonOneState();
}

class _PersonOneState extends State<PersonOne> {
  final controller = Get.put(NavigationController());
  //String s = Get.arguments == ""? "Please give a title " :  "okay";
  String? title;

  //PersonOne p = PersonOne();
  CollectionReference reference = FirebaseFirestore.instance.collection('person one details');



  List<Meeting> _getDataSource() {







    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    //final String sone = controller.title.value;
    final String? s = controller.ptwotitlefire.value == ""
        ? "No schedule from person 2"
        : controller.ptwotitlefire.value;
    final String? sOne = controller.ponetitlefire.value == ""
        ? "No schedule from person 1"
        : controller.ponetitlefire.value;

    final DateTime? startTime = controller.ptwostartfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ptwostartfire.value);

    final DateTime? startTimeOne = controller.ponestartfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ponestartfire.value);

    final DateTime? endTime = controller.ptwoendfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ptwoendfire.value);

    final DateTime? endTimeOne = controller.poneendfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.poneendfire.value);

    meetings.add(Meeting(
        sOne!, startTimeOne!, endTimeOne!, const Color(0xFFAF0614), false));
    meetings
        .add(Meeting(s!, startTime!, endTime!, const Color(0xFFAF0614), false));
    return meetings;
  }

  @override
  void initState() {
    // TODO: implement initState
    title = controller.ptwoTitle.value == ""
        ? "Please enter a title"
        : controller.ptwoTitle.value;
    super.initState();
  }

  //String s = "oka2";

  @override
  Widget build(BuildContext context) {
    //String? name = controller.ptwoTitle.value;
    bool name = false;
    int i = 0;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Get.to(() => NavigationPage());
        }),
        title: Text("Person One"),
      ),
      //body: Center(child: Text("Person One",style: TextStyle(fontSize: 50),)),
      body:

      SfCalendar(
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
            numberOfWeeksInView: 6,
            showTrailingAndLeadingDates: false,
            appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
            showAgenda: true),
        //view: CalendarView.month,
        view: CalendarView.month,
        cellBorderColor: Colors.transparent,

      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
        ),
        onPressed: () {

          //print(controller.poneStartDate.value);
          //print(controller.poneEndDate.value);
          Get.to(() => Details());
        },
      ),
    );
  }
}
