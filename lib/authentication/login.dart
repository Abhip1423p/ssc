import 'dart:convert';

import 'package:check/Wigets/appDrawer.dart';
import 'package:check/Wigets/customField.dart';
import 'package:check/Wigets/navigationBar.dart';
import 'package:check/Wigets/passwordForget.dart';
import 'package:check/authentication/ragistrationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../AppUrl.dart';
import '../main.dart';


int _state=0;

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey <FormState> ();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        _scaffoldKey.currentState.openDrawer();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.menu, color: Colors.black),
            ),
          ],

        ),
      ),
    );
  }

  Widget build(BuildContext context) {


    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: drawer(),
      ),
      // appBar: AppBar(
      //   title: Text('SSC Online',style: TextStyle(
      //     color: Colors.white
      //
      //   ),),
      //   centerTitle: true,
      //
      // ),

      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        //color: Colors.white70,
        child: Column(
          children: <Widget>[
            _backButton(),
            Flexible(
            flex: 5,
            child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

              Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/bnw.png",
                  height: 80.0,
                  width: 80.0,
                ),

              ),

              Form(
                key: _formKey,
                child: Column(

                  children: [

                    CustomTextField(
                      controller: _emailTextEditingController,
                      data: Icons.email,
                      hintText: "Email",
                      isObsecure: false,
                    ),
                    CustomTextField(
                      controller: _passwordTextEditingController,
                      data: Icons.person,
                      hintText: "Password",
                      isObsecure: true,

                    ),


                  ]

                ),
              ),


      SizedBox(
        height: 5.0,
      ),


        Container(
                    width: double.infinity,
                    child:
      RaisedButton(onPressed: (){



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


        if(_passwordTextEditingController.text.isEmpty)
        {
          loginToast("Please Enter Password");
          return;
        }

        setState(() {
          _state=1;
        });

        login(_emailTextEditingController.text,_passwordTextEditingController.text);


      },


        child:
        setUpButtonChild(),
          color: Theme.of(context).accentColor



      )),

      SizedBox(
        height: 5.0,
      ),


      InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => forgetPassword()),
          )
        },
        child: Container(
          width: double.infinity,
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: Color(0xFF666666),
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
                _divider(),
      SizedBox(
        height: 10.0,
      ),
                Container(
                    width: double.infinity,
                    child:
              SignInButton(

                Buttons.Google,
                onPressed: () {
                  //_showButtonPressDialog(context, 'Google');
                },
              )),
Container(
  height: 5.0,
  width: _screenWidth *0.8 ,
),
              // SizedBox(
              //   height: 10.0,
              // ),


              // FlatButton.icon(onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>RagistrationPage())),
              //   icon:(Icon(Icons.person,color: Colors.blue,)),
              //   label: Text("new user ?",
              //   style: TextStyle(
              //     fontSize: 15.0,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold,
              //
              //   ),
              //   ),
              //    ),
              //
              // SizedBox(
              //   height: 10.0,
              // ),
              //
              //
              // FlatButton.icon(onPressed: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) =>forgetPassword())),
              //   icon:(Icon(Icons.person,color: Colors.blue,)),
              //   label: Text("Forgot Password ?",
              //     style: TextStyle(
              //       fontSize: 15.0,
              //       color: Colors.black,
              //       fontWeight: FontWeight.bold,
              //
              //     ),
              //   ),
              // ),
                ])),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "New user register ",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RagistrationPage()),
                          )
                        },
                        child: Container(
                          child: Text(
                            "Here",
                            style: TextStyle(
                              color: Colors.blue,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )



          ],
          ),
        ),




    );




  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Login",
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


  login(String _email,String _password) async {
    final response = await http
        .post(AppUrl.LOGIN_URL, body: {
      "email": _email,
      "password": _password
    });

    final data = jsonDecode(response.body);
    int value = data['status'];

    if (value == 200) {

      String mobile = data['msg']['users_mobile'];
      String emailAPI = data['msg']['users_email'];
      String nameAPI = data['msg']['users_name'];
      String id = data['msg']['id'];
      setState(() {
        _state=0;
        savePref(mobile, emailAPI, nameAPI, id,value);
      });
      print("Logged IN");
      loginToast("Login Successfull");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return new nav();
      }));
    } else {
      setState(() {
      //customer_id=id;
      _state=0;
    });
      print("fail");
      loginToast("Some Error Occurred");
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

  savePref(String value, String email, String name, String id,int status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("value", value);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("id", id);
      preferences.setInt("status",status);
      preferences.commit();
    });
  }
}


