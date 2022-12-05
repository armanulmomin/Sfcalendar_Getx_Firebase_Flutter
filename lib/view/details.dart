import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sfcalendar_getx_flutter/controller/navigation_controller.dart';
import 'package:sfcalendar_getx_flutter/view/person_one.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final controller = Get.put(NavigationController());
  // PersonOne p = PersonOne();
  DateTime pickerDateFrom = DateTime.now();

  //TimeOfDay timeFrom = TimeOfDay.now();

  DateTime pickerDateTo = DateTime.now();

  //TimeOfDay timeTo = TimeOfDay.now();

  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  String? makeDateFormat(DateTime date){
    return "${pickerDateFrom.year}-${pickerDateFrom.month}-${pickerDateFrom.day}";
  }

  @override
  Widget build(BuildContext context) {
    //final format = DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Get.to(() => const PersonOne());
        }),
        title: const Text("Person One Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Center(
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Enter the Title of the Appointment",
                      labelText: 'Title',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const Text(
              "From",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(
                 // "Date : ${makeDateFormat(DateTime.parse(controller.ptwoStartDate.value))}"),
                  //"Date : ${dateformat{}"),
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
               // "Date : ${controller.ptwoEndDate.value}"),
                //  "Date : ${makeDateFormat(DateTime.parse(controller.ptwoEndDate.value))}"),
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
                primary: Colors.white,
              ),
              onPressed: () async {
                //String tone=titleController.toString();
                //String ttwo = pickerDateFrom.toString();
                //String tthree= pickerDateTo.toString();
                controller.poneTitle.value = titleController.text;

                controller.poneStartDate.value = pickerDateFrom.toString();
                controller.poneEndDate.value = pickerDateTo.toString();

                String titleone =  controller.poneTitle.value;
                String statdateone = controller.poneStartDate.value;
                String enddateone = controller.poneEndDate.value;
                //print(titleone);

                CollectionReference ref = FirebaseFirestore.instance.collection('person one details');
                Map<String,dynamic> datatoStore={

                  'person one title' : titleone,
                  'person one startdate ': statdateone,
                  'person one enddate ': enddateone
                };
                //print(datatoStore);
                //ref.add(controller.poneTitle.value);
               // ref.add(controller.poneStartDate.value);
                ref.add(datatoStore);

                DocumentSnapshot variable =await FirebaseFirestore.instance.collection('person one details').doc('AuzKIcjkW4DqG3EvOPbH').get();
                controller.ponetitlefire.value = variable['person one title'];
                controller.ponestartfire.value = variable['person one startdate '];
                controller.poneendfire.value = variable['person one enddate '];





                // print('hi');
                //  print(timeFrom);
              //  print(controller.poneStartDate.value);
                //   print(timeTo);
              //  print(controller.poneEndDate.value);

                //   print('hello');

                Get.to(
                  PersonOne(),
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
        initialDate: controller.ptwoStartDate.value == ""
            ? DateTime.now()
            : DateTime.parse(controller.ptwoStartDate.value),

        //firstDate: DateTime(DateTime.now().year - 5),
        // lastDate: DateTime(DateTime.now().year + 5));

        firstDate: controller.ptwoStartDate.value == ""
            ? DateTime(DateTime.now().year - 5)
            : DateTime.parse(controller.ptwoStartDate.value),
        lastDate: controller.ptwoEndDate.value == ""
            ? DateTime(DateTime.now().year + 5)
            : DateTime.parse(controller.ptwoEndDate.value));
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
        initialDate: controller.ptwoEndDate.value == ""
            ? DateTime.now()
            : DateTime.parse(controller.ptwoEndDate.value),
        //firstDate: DateTime(DateTime.now().year - 5),
        // lastDate: DateTime(DateTime.now().year + 5));
        firstDate: controller.ptwoStartDate.value == ""
            ? DateTime(DateTime.now().year - 5)
            : DateTime.parse(controller.ptwoStartDate.value),
        lastDate: controller.ptwoEndDate.value == ""
            ? DateTime(DateTime.now().year + 5)
            : DateTime.parse(controller.ptwoEndDate.value));

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
