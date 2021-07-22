import 'package:flutter/material.dart';

import 'customField.dart';




class Searchx extends StatefulWidget {
  @override
  _forgetPasswordStatez createState() => _forgetPasswordStatez();
}

class _forgetPasswordStatez extends State<Searchx> {
  final TextEditingController _emailTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState> ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 100,
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
                        data: Icons.search,
                        hintText: "Please Enter Text to Search",
                        isObsecure: false,
                      ),
                      RaisedButton(onPressed: (

                          ){},

                        child:  Text(
                            'Continue', style: TextStyle(
                              color: Colors.white

                          ),



                        ),
                          color: Colors.blue

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
}
