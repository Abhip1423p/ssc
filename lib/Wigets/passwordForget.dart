import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../AppUrl.dart';
import 'customField.dart';


int _state=0;


class forgetPassword extends StatefulWidget {
  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState> ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
            title: Text(
              'Forget Password '
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),

                  SizedBox(
                      height: 8.0),
                  SizedBox(
                    height: 20,
                  ),
                  // // Container(
                  // //   alignment: Alignment.bottomCenter,
                  // //   child: Image.asset("assets/images/splash.png",
                  // //     height: 240.0,
                  // //     width: 240.0,
                  // //   ),
                  // //
                  // ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField( // 4 parameter will pased
                            controller: _emailTextEditingController,
                            data: Icons.email,
                            hintText: "email",
                            isObsecure: false,
                          ),
                          RaisedButton(onPressed: (){
                            if(_emailTextEditingController.text.isEmpty)
                            {
                              loginToast("Please Enter Email Id");
                              return;
                            }
                            setState(() {
                              _state=1;
                            });
                            forget(_emailTextEditingController.text);

                          },

                            child:
                              setUpButtonChild(),
                              color: Theme.of(context).accentColor
                          ),


                        ],
                      )
                  )
                ],
              ),
            ),
          ),

    );
  }


  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Continue",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  forget(String email) async {
    final response = await http
        .post(AppUrl.FORGET_URL, body: {
      "email": ""+email
    });

    final data = jsonDecode(response.body);
    int value = data['status'];
    String msg=data['msg'];

    if (value == 200) {
      setState(() {
        _state=0;
      });
      print("Logged IN");
      loginToast(msg);

    } else {
      setState(() {
        _state=0;
      });
      print("fail");
      loginToast(msg);
    }
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
