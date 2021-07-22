

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Wigets/navigationBar.dart';
import 'authentication/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ssc-online",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: splashScreen(),
    );
  }
}





class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      int status = preferences.getInt("status");

      // Navigator.of(context)
      //     .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
      //   return new Home();
      // }));

     if(status==200)
     {

Navigator.of(context)
         .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
       return new nav();
     }));
     }
     else
     {
       Navigator.of(context)
           .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
         return new login();
       }));
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  throw UnimplementedError();
  }
}
