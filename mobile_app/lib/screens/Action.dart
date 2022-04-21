import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
class Actionscreen extends StatefulWidget {
  const Actionscreen({Key? key}) : super(key: key);

  @override
  _ActionscreenState createState() => _ActionscreenState();
}

class _ActionscreenState extends State<Actionscreen> {
  @override
  bool isSwitched = false;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Action",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(

        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //       hexStringToColor("467199"),
        //       hexStringToColor("3E557F"),
        //       hexStringToColor("333462"),
        //
        //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height:200,
              ),
              Switch(
                activeColor: Color(0XffFBB48B),
                  value: isSwitched,
                  onChanged: (value) async {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                    await _dbref.update({'signal': isSwitched});
                  }

              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 27, right: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0XffFBB48B),
                          blurRadius: 0,
                          spreadRadius: 20,
                          offset: Offset(1, 2),
                          blurStyle: BlurStyle.solid)
                    ]
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Text("slow"),
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0Xffffffff),
                                  blurRadius: 5,
                                  spreadRadius: 20,
                                  offset: Offset(1, 2),
                                  blurStyle: BlurStyle.solid)
                            ]),
                      ),
                      Container(
                        width: 80,
                        child: Text("medium"),
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0Xffffffff),
                                  blurRadius: 5,
                                  spreadRadius: 20,
                                  offset: Offset(1, 2),
                                  blurStyle: BlurStyle.solid)
                            ]),
                      ),Container(
                        width: 80,
                        child: Text("fast"),
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0Xffffffff),
                                  blurRadius: 5,
                                  spreadRadius: 20,
                                  offset: Offset(1, 2),
                                  blurStyle: BlurStyle.solid)
                            ]),
                      ),
                    ]),
              ),
            ],
          ),
        ),

      ),


    );
  }
}