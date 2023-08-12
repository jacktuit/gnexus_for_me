import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          titleDropDown: "Profile",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xd104cc0)),
                  child: Row(
                    children: [

                      PopupMenuButton<String>(
                        icon: Icon(Icons.filter_alt_outlined,color:Color(0xff104CC0) ,), // Custom icon
                        onSelected: (String result) {
                          // Handle the selection of a menu item
                          print("Selected: $result");
                        },
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuEntry<String>>[

                            PopupMenuItem<String>(
                              value: 'item1',
                              child: Row(
                                children: [
                                  
                                  Column(
                                    children: [
                                      Icon(Icons.calendar_month),
                                      Text("Date")
                                    ],
                                  ), Column(
                                    children: [
                                      Icon(Icons.private_connectivity_outlined),
                                      Text("Connections")
                                    ],
                                  ),

                                ],
                              ),
                            ),

                          ];
                        },
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(color: Color(0xff104CC0)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF9F9F9),
              ),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0,
                children: List.generate(10, (index) {
                  return Container(
                    //
                    child: Center(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                          onTap: () {
                            biggerPicture("assets/a_man.png");
                          },
                          child: Image.asset("assets/a_man.png")),
                    )),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void biggerPicture(String imageName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10,),
                Row(children: [
                  Spacer(),
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  SizedBox(width: 5,),

                  Icon(Icons.cancel_outlined),
                  SizedBox(width: 20,)
                ],),
                Container(
                  padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 8),
                  child: Image.asset(imageName))],
            ),
          );
        });
  }
}
