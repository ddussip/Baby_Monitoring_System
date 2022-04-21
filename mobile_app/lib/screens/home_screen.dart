import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../reusable_widgets/data.dart';

String displayText1 = '0.0';
String displayText2 = '0';
String emotion1="happy";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  static var data;
  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = (prefs.getInt('counter') ?? 0);
    });
    print("loded count");
    print(count);
  }

  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  @override
  void initState() {
    super.initState();
    loadCounter();
    sleep(const Duration(seconds: 1));
    _activateListeners();
    // _controller = VideoPlayerController. network(
    //   //'https://youtu.be/rBkN0HpQ9gE',
    //   'https://s2.dmcdn.net/v/AXTgV1Rm_3LyhsLen/x360',);

    // asset("assets/video/baby.mp4", );

    // _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
  }
  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }


  void _activateListeners() {
    _dbref.child('tempandhumi').onValue.listen((event) {
      final String temp = event.snapshot.child('temp').value.toString();
      final String temp1 = event.snapshot.child('humidity').value.toString();
      final String emotion = event.snapshot.child('emotion').value.toString();
      // final temp=event.snapshot.value;
      data = temp;
      setState(() {
        print(temp);
        print(data);
        displayText1 = data+'°C' ;
        displayText2 =temp1+'%' ;
        emotion1=emotion;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   hexStringToColor("467199"),
        //   hexStringToColor("3E557F"),
        //   hexStringToColor("333462"),
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 150,
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
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 80,
                        margin: EdgeInsets.only(top: 40, bottom: 40),

                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.thermometer,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              displayText1,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),

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
                        margin: EdgeInsets.only(top: 40, bottom: 40),

                        child: Row(
                          children: [
                            Icon(CupertinoIcons.drop, size: 25),
                            SizedBox(
                              width: 10,
                            ),
                            Text(displayText2, style: TextStyle(fontSize: 20)),
                          ],
                        ),

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
           Container(
             margin: EdgeInsets.only(left: 27, right: 30,top: 50),
             decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 boxShadow: const [
                   BoxShadow(
                       color: Color(0XffFBB48B),
                       blurRadius: 5,
                       spreadRadius: 20,
                       offset: Offset(1, 2),
                       blurStyle: BlurStyle.solid)
                 ]),
             child:Image.asset("assets/images/baby.jpg",width: 225,height:200, fit:BoxFit.fill),
           //   FutureBuilder(
           //   future: _initializeVideoPlayerFuture,
           //   builder: (context, snapshot) {
           //     if (snapshot.connectionState == ConnectionState.done) {
           //       // If the VideoPlayerController has finished initialization, use
           //       // the data it provides to limit the aspect ratio of the video.
           //       return AspectRatio(
           //         aspectRatio: _controller.value.aspectRatio,
           //         // Use the VideoPlayer widget to display the video.
           //         child: ClipRRect(
           //             borderRadius: BorderRadius.circular(15),
           //             child: VideoPlayer(_controller)),
           //       );
           //     } else {
           //       // If the VideoPlayerController is still initializing, show a
           //       // loading spinner.
           //       return const Center(
           //         child: CircularProgressIndicator(),
           //       );
           //     }
           //   },
           // ),

           ),
              Container(
                width: 500,
                margin: EdgeInsets.only(left: 27, right: 30,top: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0XffFBB48B),
                          blurRadius: 5,
                          spreadRadius: 20,
                          offset: Offset(1, 2),
                          blurStyle: BlurStyle.solid)
                    ]),
               child: Center(
                 child: Container(


                    margin: EdgeInsets.only(top: 40, bottom: 40,left: 100,right: 100),

                    child: Text(emotion1),

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
               ),
              )


            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown.
      //     setState(() {
      //       // If the video is playing, pause it.
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         // If the video is paused, play it.
      //         _controller.play();
      //       }
      //     });
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}
