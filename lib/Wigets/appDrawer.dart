import 'package:check/authentication/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';


class drawer extends StatefulWidget {
  @override
  _drawerState createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35.0,bottom: 10.0),
      child:
      Column(

        children: <Widget>[

          SizedBox(
              height: 20.0),
          Material(

            borderRadius: BorderRadius.all(Radius.circular(80.0)),
            elevation: 8.0,
            child: Container(

              child: Image.asset("assets/images/user.png"),
            ),
          ),
          SizedBox(
              height: 25.0),

          Text(
            "Gokul Kumar",
            style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
              height: 20.0),
          Divider(height: 10.0,color: Colors.white,thickness: 6.0,),


          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home, color: Theme.of(context).accentColor),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);

                    // Navigator.pushNamed(context, '/Products');

                  //  Navigator.push(context, new MaterialPageRoute(
                   //   builder: (context) =>  MainScreen(),
                   // ));
                  },
                ),
                Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

                //Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
                ListTile(
                  leading:
                  Icon(Icons.category, color: Theme.of(context).accentColor),
                  title: Text('BNW Blog'),
                  onTap: () {
                 //   _launchURL("https://www.scconline.com/blog");
                  },
                ),
                Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
                ListTile(
                  leading: Icon(Icons.store,
                      color: Theme.of(context).accentColor),
                  title: Text('BNW web'),
                  onTap: () {

                  },
                ),
                Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
                ListTile(
                  leading: Icon(Icons.account_circle,
                      color: Theme.of(context).accentColor),
                  title: Text('About us'),
                  onTap: () {

                  },
                ),






                Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
                ListTile(
                  leading: Icon(Icons.exit_to_app,
                      color: Theme.of(context).accentColor),
                  title: Text('Logout'),
                  onTap: () async {

                    showAlertDialog(context);
//                  if (x_id == null || x_id.isEmpty) {
//                    Navigator.of(context).push(MaterialPageRoute<Null>(
//                        builder: (BuildContext context) {
//                      return new AppSignIn();
//                    }));
//                  } else if(x_id.isNotEmpty){
//                    showAlertDialog(context);
//                  }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("YES"),
      onPressed: () {
        signOut();
      },
    );

    Widget Cancel = FlatButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to Logout?"),
      actions: [okButton, Cancel],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("value", null);
      preferences.setString("name", null);
      preferences.setString("email", null);
      preferences.setString("id", null);
      preferences.setInt("status", null);

      preferences.commit();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new login();
          }));
    });
  }
}



