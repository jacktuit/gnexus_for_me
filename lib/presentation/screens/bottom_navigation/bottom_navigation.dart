import 'package:flutter/material.dart';
import '../connection_screen/connection_screen.dart';
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
    {'pageName': FamilyTree(), 'title': 'Family tree'},
    {'pageName': FamilyTree(), 'title': 'Gnexus Cloud'},
    {'pageName': GnexCloudScreen(), 'title': 'Gallery'},
    {'pageName': FamilyTree(), 'title': 'Image Editingd'},
    {'pageName': ConnectionScreen(), 'title': 'Connection'},

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.selectedIndex]['pageName'],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Color(0xff000080),

          unselectedItemColor: Colors.black,
          elevation: 2,
          backgroundColor: Color(0xffF2F2F8),
          currentIndex: widget.selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              widget.selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/main.png')),
                label: "Family tree"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/cloud.png')),
                label: "Gnexus Cloud"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/galilery.png')),
                label: "Gallery"),

            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/editing.png')),
                label: "Image Editing"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt),
                label: "Connection")
          ],
        ),
      ),
    );
  }
}