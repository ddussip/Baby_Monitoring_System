import 'package:firebase_database/firebase_database.dart';
import 'package:login_page/screens/Action.dart';
import 'package:login_page/screens/Notification.dart';
import 'package:login_page/screens/Settings.dart';
import 'package:login_page/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'Activity.dart';
import 'edit_profile.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var _selectedIndex=0;


  final screens = [
    HomeScreen(),
    Actionscreen(),
    //Activityscreen(),
    Notificationscreen(),
    EditProfilePage(),
    //Settingscreen(),


  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isSwitched = false;
  final DatabaseReference _dbref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "B care",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body:  IndexedStack(
        index: _selectedIndex,
        children: screens,
      ) ,                   //Container(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                // title: Text('Home'),
                backgroundColor:Color(0xffffffff)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.call_to_action),
                label: "Action",
                 // : Text('Action'),
                backgroundColor:Color(0xffffffff)
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.local_activity),
            //     label: "Activity",
            //   //title: Text('Activity'),
            //     backgroundColor:Color(0xffffffff)          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_important),
                label: "Notification",
             // title: Text('Notification'),
                backgroundColor:Color(0xffffffff)           ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
                label: "Settings",
              //title: Text('Settings'),
                backgroundColor:Color(0xffffffff)           ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 100,
          showSelectedLabels: true,
          selectedItemColor: Color(0xffFB9E6A),
          unselectedItemColor: Colors.black,

      ),
    );
  }
}
