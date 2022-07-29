import 'package:flutter/material.dart';
import 'package:pm/screen/viewprofile.dart';
import '/screen/newre.dart';
import '/screen/ptabs.dart';
import 'doctorlogin.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController id = TextEditingController();
  void showsnakbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Enter ID"),
      duration: Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("PMS")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                //    padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                width: 300,

                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ID',
                    labelText: "ID",
                    //      icon: Icon(Icons.person)
                    //
                  ),
                  controller: id,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      if (id.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Enter ID"),
                          duration: Duration(milliseconds: 500),
                        ));
                      } else {
                        setState(() {
                          id.text;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => viewprofile(id.text)));
                                  setState(() {
                          id.text;
                        });
                        //  id.clear();
                      }
                    },
                    child: Text("login")),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const newre()));
                    },
                    child: Text("New Registration?")),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const doctorLogin()));
                    },
                    child: Text("Doctor")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
