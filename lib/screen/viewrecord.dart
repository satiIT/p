

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pm/screen/record.dart';
late String id;
var did;

class viewRecord extends StatefulWidget {
  viewRecord(String d) {
    id = d;
   // did = dd;
  }

  @override
  State<viewRecord> createState() => _viewRecordState();
}

class _viewRecordState extends State<viewRecord> {
  // const viewRecord({Key? key}) : super(key: key);
  var me;
  s() {
    setState(() {
      id;
    });
  }

 

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users/$id/record')
  //    .where('idNumber', isEqualTo: int.parse(id))
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Center(
     child: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Center(
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    me = document.id;
                    //   data['recordId'].toString();
                    // data['illnessName'];
                    print(me);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => record(document.id,id)));
                  },
                  child: Center(
                    child: Text(data['illnessName']),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
   ));
  }
}
