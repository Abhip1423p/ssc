
import 'package:flutter/material.dart';


class myAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.green,

      ),
      flexibleSpace: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.white,Colors.white],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.1, 0.0),
            stops:[0.0,1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      centerTitle: true,
      title: Text("SSC ONLINE",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
          color: Colors.white,

        ),

      ),
      // actions
    );
  }
}
