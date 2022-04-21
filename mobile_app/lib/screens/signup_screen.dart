import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:login_page/reusable_widgets/reusable_widget.dart';
import 'package:login_page/screens/MainScreen.dart';
import 'package:login_page/screens/home_screen.dart';
import 'package:login_page/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  OtpFieldController otpController = OtpFieldController();
  @override
  var x;
  int count1 = 0;
  int count2 = 0;

  Widget build(BuildContext context) {
    // List<Widget> children = List<String>.filled(2, null);

    List<Widget> children =  List.generate(count1, (int i) => new InputWidget(i));
    List<Widget> children1 =  List.generate(count2, (int i) => new InputWidget1(i));
    if (count1 == 1) {
      count1 -= 1;
      //print("connt decremented");
    }
    if (count2 == 1) {
      count2 -= 1;
      //print("connt decremented");
    }
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(colors: [
            //       hexStringToColor("467199"),
            //       hexStringToColor("3E557F"),
            //       hexStringToColor("333462"),
            //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 120, 20, 0),

                    child: Column(
                        children: <Widget>[
                          //                 Column(
                          //           children: children
                          // ),
                          Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField(
                                    "Enter UserName", Icons.person_outline,
                                    false,
                                    _userNameTextController),
                                const SizedBox(
                                  height: 20,
                                ),


                                reusableTextField(
                                    "Enter Email Id", Icons.person_outline,
                                    false,
                                    _emailTextController),
                                const SizedBox(
                                  height: 20,
                                ),
                                reusableTextField(
                                    "Enter Password", Icons.lock_outlined, true,
                                    _passwordTextController),

                                const SizedBox(
                                  height: 20,

                                ),


                                // firebaseUIButton(context, "create account", () {
                                //   FirebaseAuth.instance
                                //       .createUserWithEmailAndPassword(
                                //       email: _emailTextController.text,
                                //       password: _passwordTextController.text)
                                //       .then((value) {
                                //     print("Created New Account");
                                //     Navigator.push(context,
                                //         MaterialPageRoute(builder: (context) =>
                                //             HomeScreen()));
                                //   }).onError((error, stackTrace) {
                                //     print("Error ${error.toString()}");
                                //   });
                                // })
                              ])
                        //])))));
              ,  TextButton(onPressed: (){
                  if(_passwordTextController.value.text.length<6){
                    setState(() {
                      count1+=1;
                    });

                  }else {
                    sendOtp();
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) =>  VerificationEmail()));
                  }}, child: Text("send OTP")),
                OTPTextField(
                    controller: otpController,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.underline,
                    outlineBorderRadius: 12,
                    style: TextStyle(fontSize: 12),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                      x=pin;
                    }),
                TextButton(onPressed: (){
                  if(verifyOtp()){
                    FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MainScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                          setState(() {
                            if(count2==0){
                              count2+=1;
                            }

    }
                          );

                      });
                }
                  }, child: Text("Verify OTP")),



                    const SizedBox(
                      height: 50,
                    ),

                     Column(
                       children:children
                     ),
                    Column(
                        children:children1
                    ),
    ],

          ),
    ),
    ),

    ));
  }
  bool submitValid = false;
  EmailAuth emailAuth = EmailAuth(
    sessionName: "Newborn baby Monitoring System",
  );
  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailTextController.value.text, otpLength: 6);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }
  bool verifyOtp()  {
    var result=emailAuth.validateOtp(
        recipientMail: _emailTextController.value.text,
        userOtp: x);
    return result;
  }
}
class InputWidget extends StatelessWidget {

  final int index;

  InputWidget(this.index);
  @override
  Widget build(BuildContext context) {
    //if(index==1) {
      return Text("password must be have 6 character",style: TextStyle(color: Colors. red));
    }
  }
class InputWidget1 extends StatelessWidget {

  final int index;

  InputWidget1(this.index);
  @override
  Widget build(BuildContext context) {
    return Text("The email address is already in use by another account.",style: TextStyle(color: Colors. red));
  }
}

