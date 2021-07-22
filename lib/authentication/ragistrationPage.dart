import 'dart:convert';

import 'package:check/Wigets/customField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


import '../AppUrl.dart';

int _state=0;

class RagistrationPage extends StatefulWidget {
  @override
  _RagistrationPageState createState() => _RagistrationPageState();
}

class _RagistrationPageState extends State<RagistrationPage> {


  final TextEditingController _nameTextEditingController = TextEditingController();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _mobileTextEditingController = TextEditingController();
  final TextEditingController _confirmpasswordTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState> ();
  @override
  Widget build(BuildContext context) {


    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'SSC ONLINE',
      //     style: TextStyle(
      //
      //     ),
      //   ),
      //   centerTitle: true,
      //
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 0,top: 30,right: 0,bottom: 5),
      child:
      SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 50.0,
              ),
              InkWell(
             // onTap: _selectAndImage,
                child:  Image.asset("assets/images/user.png"),



              ),
              SizedBox(
                height: 38.0),
          Form(
            key: _formKey,
            child: Column(
            children: [
              CustomTextField(
                controller: _nameTextEditingController,
                data: Icons.person,
                hintText: "Name",
                isObsecure: false,

              ),

              CustomTextField( // 4 parameter will pased
                controller: _emailTextEditingController,
                data: Icons.email,
                hintText: "Email",
                isObsecure: false,

              ),
              // CustomTextField( // 4 parameter will pased
              //   controller: _mobileTextEditingController,
              //   data: Icons.mobile_screen_share,
              //   hintText: "Mobile No",
              //
              //   isObsecure: false, // as it is hint so name will be visible for that we need it to make it fasle
              //
              // ),

              Container
                (
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: _mobileTextEditingController,
                  obscureText: false,
                    keyboardType: TextInputType.number,
                  maxLength: 10,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.mobile_screen_share,
                      color: Theme.of(context).primaryColor,

                    ),
                    focusColor: Theme.of(context).primaryColor,
                    hintText: "Mobile No",

                  ),

                ),
              ),

              CustomTextField( // 4 parameter will pased
                controller: _confirmpasswordTextEditingController,
                data: Icons.lock,
                hintText: "Password",
                isObsecure: true, // as it is hint so name will be visible for that we need it to make it fasle

              ),
              SizedBox(
                  height: 20.0),

              RaisedButton(onPressed: (


                  ){
                if(_nameTextEditingController.text.isEmpty)
                {
                  loginToast("Please Enter Name");
                  return;
                }

                if(_emailTextEditingController.text.isEmpty)
                {
                  loginToast("Please Enter Email Id");
                  return;
                }

                if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(_emailTextEditingController.text)) {
                  loginToast("Please Enter Valid Email Id");
                  return;
                }

                if(_mobileTextEditingController.text.isEmpty)
                {
                  loginToast("Please Enter Mobile Number");
                  return;
                }

                if(_confirmpasswordTextEditingController.text.isEmpty)
                {
                  loginToast("Please Enter Password");
                  return;
                }

                setState(() {
                  _state=1;
                });

                register(_nameTextEditingController.text,_emailTextEditingController.text,_mobileTextEditingController.text,_confirmpasswordTextEditingController.text);
              },

                child:  setUpButtonChild(),
                  color: Theme.of(context).accentColor
              )

                ],
          )
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Register",
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

  register(String _name,String _email,String _phoneNumber,String _password) async {
    final response = await http
        .post(AppUrl.REGISTER_URL, body: {
      "name": _name,
      "email": _email,
      "mobile":_phoneNumber,
      "password":_password
    });

    final data = jsonDecode(response.body);
    int value = data['status'];


    if (value == 200) {
      setState(() {
        _state=0;
      });
      print("Logged IN");
      loginToast("Successfully Registered");
      // Navigator.of(context)
      //     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      //   return new OTP(_phoneNumber);
      // }));
    } else {
      setState(() {
        _state=0;
      });
      print("fail");
      loginToast(data['msg']);
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
