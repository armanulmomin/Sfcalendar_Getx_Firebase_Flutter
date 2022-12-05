import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/navigation_controller.dart';
class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  final controller = Get.put(NavigationController());

  CollectionReference reference = FirebaseFirestore.instance.collection('person one details');
  String? name;
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(title: Text('Testing'),),
      body: Column(
        children: [
          ElevatedButton(

            onPressed: () async {
              //int count  = snapshot.data?.docs.length;
              DocumentSnapshot variable =await FirebaseFirestore.instance.collection('person one details').doc('AuzKIcjkW4DqG3EvOPbH').get();
              controller.ponetitlefire.value = variable['person one title'];
              print(name);

            }, child: const Text('Raised Button'),
          ),
          Text('$name'),
        ],
      ),


      
      
      /*StreamBuilder(
        stream: reference.snapshots(),
        builder: (context, snapshot)
        {
          if(snapshot.hasError)
            {
              return Text('wrong data format');

            }
          if(snapshot.hasData)
            {

              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context,i)
                  {
                    //return Text(snapshot.data!.docs[i]['person one title']);
                    name = Text(snapshot.data!.docs[i]['person one startdate ']).toString();
                    return Text(snapshot.data!.docs[i]['person one startdate ']);

                  }
                  /*
                  DocumentSnapshot personone = snapshot.data?.docs[i] as DocumentSnapshot<Object?>;
              {
                DocumentSnapshot personone = snapshot.data?.docs[i] as DocumentSnapshot<Object?>;
                //return Text("${snapshot.data?.docs[i].data().['title'].value.toString()}");
                return ListTile(
                 // title: Text(personone['person one startdate']),

                  title: Text(personone['person one title']),
                  //subtitle: Text(personone['person one enddate']),

                );
                String s = Text(personone['person one title']);

              }

                   */
              );
              print(name);




            //  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
             // return Text("Full Name: ${data['full_name']} ${data['last_name']}");

            }
          return Text('loading');
        },

      ),
      
       */
      







    );



  }

}
