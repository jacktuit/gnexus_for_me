import 'package:flutter/material.dart';

import '../family_tree_screen/family_tee.dart';
import '../gnex_cloud_screen/gnex_cloud_screen.dart';




class MainPage extends StatefulWidget {
  int selectedIndex;
  MainPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, dynamic>> pages = [
    {'pageName': FamilyTree(), 'title': 'Catalog'},
    {'pageName': GnexCloudScreen(), 'title': 'Settings'}
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.selectedIndex]['pageName'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black45,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            widget.selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.black,
              ),
              label: "Catalog"),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                // color: Colors.black,
              ),
              label: "Settings")
        ],
      ),
    );
  }
}