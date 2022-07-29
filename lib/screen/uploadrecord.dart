import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController illness = TextEditingController();
TextEditingController hospital = TextEditingController();
TextEditingController diagnoses = TextEditingController();
TextEditingController medicine = TextEditingController();
TextEditingController comment = TextEditingController();
List<String> diagnosesList = ['s'];
late List<String> medicineList = ['v'];

class uploadRecord extends StatefulWidget {
  const uploadRecord({Key? key}) : super(key: key);

  @override
  State<uploadRecord> createState() => _uploadRecordState();
}

CollectionReference users =
    FirebaseFirestore.instance.collection('users/dnKK4bdwLbMlkJLZ6s75/record');

Future<void> addUser() {
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'illnessName': illness.text, // John Doe
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

class _uploadRecordState extends State<uploadRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("upload")),
        body: ListView(
          children: [
            Container(
              //    padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: 300,

              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'IllnessName',
                  labelText: "Illness",
                  //           icon: Icon(Icons.person)
                ),
                //   controller: illness,
                controller: illness,
                //  keyboardType: TextInputType.number,
              ),
            ),
            Container(
              //    padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: 300,

              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hospital Name',
                  labelText: "Hospital Name",
                  //           icon: Icon(Icons.person)
                ),
                controller: hospital,
                //   keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.amber),
              ),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Diagnoses Name:',
                      labelText: "Diagnoses",
                    ),
                    controller: diagnoses,
                    //  keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        diagnosesList.add(diagnoses.text);
                      });
                    },
                    icon: Icon(Icons.add)),

                //

                //   if (diagnosesList.isNotEmpty)
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    height: 150,
                    child: ListView.builder(
                        itemCount: diagnosesList.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(diagnosesList[index]),
                                  IconButton(
                                      onPressed: null, icon: Icon(Icons.camera))
                                ]),
                          );
                          ;
                        })),
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.amber)),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Medicine Name',
                      labelText: "Medicines",
                      //           icon: Icon(Icons.person)
                    ),
                    controller: medicine,
                    //   keyboardType: TextInputType.number,
                  ),

                  IconButton(
                      onPressed: () {
                        setState(() {
                          medicineList.add(medicine.text);
                        });
                      },
                      icon: Icon(Icons.add)),

                  //

                  //    if (diagnosesList.isNotEmpty)

                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Container(
                      height: 80,
                      child: ListView.builder(
                          itemCount: medicineList.length,
                          itemBuilder: ((context, index) {
                            return ListTile(title: Text(medicineList[index]));
                          })),
                    ),
                  ),
                ],
              ),
            ),
            Card(
                color: Color.fromRGBO(255, 254, 229, 1),
                child: Row(
                  children: [
                    Text("Chronic :"),
                    Checkbox(value: false, onChanged: null),
                  ],
                )),
            Card(
                color: Color.fromRGBO(255, 254, 229, 1),
                child: Row(
                  children: [
                    Text("Surgery :"),
                    Checkbox(value: false, onChanged: null),
                  ],
                )),
            Container(
              //    padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              width: 300,

              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comment',
                  labelText: "Comment",
                  //           icon: Icon(Icons.person)
                ),
                controller: comment,
                //   keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addUser();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
