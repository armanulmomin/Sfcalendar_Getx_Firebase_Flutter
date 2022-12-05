import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sfcalendar_getx_flutter/controller/navigation_controller.dart';
import 'package:sfcalendar_getx_flutter/view/person_two.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonTwoDetails extends StatefulWidget {
  const PersonTwoDetails({Key? key}) : super(key: key);

  @override
  State<PersonTwoDetails> createState() => _PersonTwoDetailsState();
}

class _PersonTwoDetailsState extends State<PersonTwoDetails> {
  final controller = Get.put(NavigationController());
  // PersonOne p = PersonOne();
  DateTime pickerDateFrom = DateTime.now();

  TimeOfDay timeFrom = TimeOfDay.now();

  DateTime pickerDateTo = DateTime.now();

  TimeOfDay timeTo = TimeOfDay.now();

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final format = DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Get.to(() => PersonTwo());
        }),
        title: Text("Person two Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Center(
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter the Title of the Appointment",
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            Text(
              "From",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                  "Date : ${pickerDateFrom.year}-${pickerDateFrom.month}-${pickerDateFrom.day}"),
              trailing: Icon(Icons.arrow_downward),
              onTap: _pickDateFrom,
            ),
            /*
            ListTile(
              title: Text("Time : ${timeFrom.hour}:${timeFrom.minute}"),
              trailing: Icon(Icons.arrow_downward),
              onTap: _pickTimeFrom,
            ),

             */
            Text(
              "To",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                  "Date : ${pickerDateTo.year}-${pickerDateTo.month}-${pickerDateTo.day}"),
              trailing: Icon(Icons.arrow_downward),
              onTap: _pickDateTo,
            ),
            /*
            ListTile(
              title: Text("Time : ${timeTo.hour}:${timeTo.minute}"),
              trailing: Icon(Icons.arrow_downward),
              onTap: _pickTimeTo,
            ),

             */
            /*


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: TextField(
                  controller: descController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Enter the Description of the Appointment",
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),

             */

            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.black,
              ),
              onPressed: () async {
                //String tone=titleController.toString();
                //String ttwo = pickerDateFrom.toString();
                //String tthree= pickerDateTo.toString();
                controller.ptwoTitle.value = titleController.text;

                controller.ptwoStartDate.value = pickerDateFrom.toString();
                controller.ptwoEndDate.value = pickerDateTo.toString();

                String titletwo =  controller.ptwoTitle.value;
                String statdatetwo = controller.ptwoStartDate.value;
                String enddatetwo = controller.ptwoEndDate.value;
                //print(titleone);

                CollectionReference ref = FirebaseFirestore.instance.collection('person two details');
                Map<String,dynamic> datatoStore={

                  'person two title' : titletwo,
                  'person two startdate ': statdatetwo,
                  'person two enddate ': enddatetwo
                };
                //print(datatoStore);
                //ref.add(controller.poneTitle.value);
                // ref.add(controller.poneStartDate.value);
                ref.add(datatoStore);

                DocumentSnapshot variable =await FirebaseFirestore.instance.collection('person two details').doc('PKulEAJPZRmbwdOzvLuz').get();
                controller.ptwotitlefire.value = variable['person two title'];
                controller.ptwostartfire.value = variable['person two startdate '];
                controller.ptwoendfire.value = variable['person two enddate '];

                Get.to(
                  PersonTwo(),
                );
                /*


                 */

                //print(meetings2);

                //print(meetings);

                //  print(pickerDateFrom);
                // print(pickerDateTo);
                // print(titleController.text);
                // print(descController.text);
              },
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )

            //  DateTimeField(onDateSelected: onDateSelected, selectedDate: selectedDate)
          ],
        ),
      ),
    );
  }

  _pickDateFrom() async {
    DateTime? date = await showDatePicker(
        context: context,
        //initialDate: DateTime.now(),
       // firstDate: DateTime(DateTime.now().year - 5),
      //  lastDate: DateTime(DateTime.now().year + 5));

     initialDate: controller.poneStartDate.value == "" ? DateTime.now() : DateTime.parse(controller.poneStartDate.value),
     firstDate: controller.poneStartDate.value == "" ? DateTime(DateTime.now().year - 5) : DateTime.parse(controller.poneStartDate.value),
      lastDate: controller.poneEndDate.value == "" ? DateTime(DateTime.now().year + 5) : DateTime.parse(controller.poneEndDate.value));

    if (date != null) {
      setState(() {
        pickerDateFrom = date;
      });
    }
  }
/*
  _pickTimeFrom() async {
    TimeOfDay? t = await showTimePicker(
      context: context,
      initialTime: timeFrom,
    );

    if (t != null) {
      setState(() {
        timeFrom = t;
      });
    }
  }

 */

  _pickDateTo() async {
    DateTime? date = await showDatePicker(
        context: context,
        //initialDate: DateTime.now(),
       // firstDate: DateTime(DateTime.now().year - 5),
       // lastDate: DateTime(DateTime.now().year + 5));
      initialDate: controller.poneEndDate.value == "" ? DateTime.now(): DateTime.parse(controller.poneEndDate.value),
       firstDate: controller.poneStartDate.value == "" ? DateTime(DateTime.now().year - 5) : DateTime.parse(controller.poneStartDate.value),
      lastDate: controller.poneEndDate.value == "" ? DateTime(DateTime.now().year + 5) : DateTime.parse(controller.poneEndDate.value));

    if (date != null) {
      setState(() {
        pickerDateTo = date;
      });
    }
  }
/*
  _pickTimeTo() async {
    TimeOfDay? t = await showTimePicker(
      context: context,
      initialTime: timeTo,
    );

    if (t != null) {
      setState(() {
        timeTo = t;
      });
    }
  }

 */
}
