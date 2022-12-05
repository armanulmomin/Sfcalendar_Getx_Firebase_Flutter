import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sfcalendar_getx_flutter/view/person_two_detail.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../controller/navigation_controller.dart';
import '../model/meeting.dart';
import '../model/meeting_data_source.dart';
import 'details.dart';
import 'navigation_page.dart';
class PersonTwo extends StatefulWidget {
  const PersonTwo({Key? key}) : super(key: key);

  @override
  State<PersonTwo> createState() => _PersonTwoState();
}

class _PersonTwoState extends State<PersonTwo> {
  final controller = Get.put(NavigationController());
  String? title;
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    //final String sone = controller.title.value;
    final String? s = controller.ponetitlefire.value == "" ? "No schedule from person 1" : controller.ponetitlefire.value;
    final String? stwo = controller.ptwotitlefire.value == "" ? "No schedule from person 2" : controller.ptwotitlefire.value;

    final DateTime? startTime = controller.ponestartfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ponestartfire.value);

    final DateTime? StartDatetwo = controller.ptwostartfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ptwostartfire.value);
    final DateTime? endTime = controller.poneendfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.poneendfire.value);

    final DateTime? endTimetwo = controller.ptwoendfire.value == ""
        ? DateTime.now()
        : DateTime.parse(controller.ptwoendfire.value);

    meetings.add( Meeting(stwo!, StartDatetwo!, endTimetwo!, const Color(
        0xFFAF0614), false));
    meetings.add(
        Meeting(s!, startTime!, endTime!, const Color(0xFFAF0614), false));
    return meetings;

  }

  @override
  void initState() {
    // TODO: implement initState
    title=controller.poneTitle.value == "" ? "Please enter a title" : controller.poneTitle.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Get.to(() => NavigationPage());
        }),
        title: Text("Person Two"),),
      //body: Center(child: Text("Person One",style: TextStyle(fontSize: 50),)),
      body: SfCalendar(
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.indicator, showAgenda: true),
        view: CalendarView.month,
        cellBorderColor: Colors.transparent,

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(()=> PersonTwoDetails());
        },
      ),
    );
  }
}
