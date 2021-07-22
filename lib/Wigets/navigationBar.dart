import 'package:flutter/material.dart';

import 'Search.dart';
import 'appDrawer.dart';

class nav extends StatefulWidget {
  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(),
      ),
      body: Container(
        child: Searchx()
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
        BottomNavigationBarItem(
            icon:Icon(Icons.home),
          title: Text('Home'),
          backgroundColor: Colors.black
        ),
          BottomNavigationBarItem(
              icon:Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.brightness_low),
              title: Text('Blog'),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.devices_other),
              title: Text('Other'),
              backgroundColor: Colors.black
          ),

        ],
        onTap: (index){
          setState(() {
            _currentIndex= index;
          });
        },
      ),
    );
  }
}




