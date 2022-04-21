import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:login_page/screens/Notification.dart';

import '../reusable_widgets/data.dart';
class Activityscreen extends StatefulWidget {
  const Activityscreen({Key? key}) : super(key: key);

  @override
  _ActivityscreenState createState() => _ActivityscreenState();
}

class _ActivityscreenState extends State<Activityscreen> {
  var photos = [
   // Image.network(FireStorageService.loaddImage(context, image));
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //getPhotos();
  }
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
          "Activity",
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
              ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  // This builder will only get called when the _counter
                  // is updated.
                  return ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (BuildContext context, int indexpos) {
                      return Text("hello");
                    },
                  );
                },
                valueListenable: d,
                // The child parameter is most helpful if the child is
                // expensive to build and does not depend on the value from
                // the notifier.

              )
            ],
          ),
        ),

      ),
    );
  }

  // Future getPhotos() async {
  //   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  //
  //   // for(int i=0;i<5;i++){
  //   //   var url =await storage.ref().child('baby/').getDownloadURL();
  //   // }
  //
  //   print("url:........................................................................");
  //   print(url);
  //   setState(() {});
  // }


  Future getNotification() async {
  //  var imageRef
    // setState(() {
    //   notifications =
    //       List.from(notiRef.docs.map((doc) => Data.fromSnapshot(doc)));
    //   d=ValueNotifier<int>(notifications.length);
    // });

  }

}
class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loaddImage(BuildContext context,String image) async{
    return await FirebaseStorage.instance.ref().child('baby/').getDownloadURL();
  }
}