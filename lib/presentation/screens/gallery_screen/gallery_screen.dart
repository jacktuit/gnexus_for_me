import 'package:flutter/material.dart';
import 'package:gnexus/presentation/screens/gallery_screen/part_of_gallery/bigger_picture.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

import '../../../utils/utils_variable/variables.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xd104cc0)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: PopupMenuButton<String>(
                          offset: Offset(
                            60,
                            30,
                          ),
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: UtilsVariables.appColor,
                            size: 18,
                          ),
                          // Custom icon
                          onSelected: (String result) {
                            // Handle the selection of a menu item
                            print("Selected: $result");
                          },
                          shadowColor: Colors.white,
                          color: Colors.white,

                          elevation: 3,
                          itemBuilder: (BuildContext context) {
                            return <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'item1',
                                child: Container(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: UtilsVariables.appColor,
                                          ),
                                          Text(
                                            "Date",
                                            style: TextStyle(
                                              color: UtilsVariables.appColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.private_connectivity_outlined,
                                            color: UtilsVariables.appColor,
                                          ),
                                          Text(
                                            "Connections",
                                            style: TextStyle(
                                              color: UtilsVariables.appColor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                              ),
                            ];
                          },
                        ),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          "Filter",
                          style: TextStyle(color: UtilsVariables.appColor),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                height: 30,
                child: Checkbox(
                    activeColor: UtilsVariables.appColor,
                    value: selectAll,
                    onChanged: (value) {
                      selectAll = !selectAll;
                      setState(() {});
                    }),
              ),
              Text("Select all"),
              Spacer(),
              selectAll?
              Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: UtilsVariables.appColor,
                  ),
                  Text(
                    "Delete Selected Photos",
                    style: TextStyle(color: UtilsVariables.appColor),
                  ),
                ],
              ):Container(),
              Spacer()
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffF9F9F9),
                // color: Colors.red
              ),
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: GridView.count(
                crossAxisCount: 2, // Number of columns in the grid
                // mainAxisSpacing: 10.0, // Spacing between rows
                // crossAxisSpacing: 10.0,
                children: List.generate(10, (index) {
                  return Stack(
                    children: [
                      Container(
                        child: Center(
                            child: Container(
                          // padding: EdgeInsets.only(right: 10),
                          child: InkWell(
                              onTap: () {
                                biggerPicture("assets/a_man.png");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: selectAll ? UtilsVariables.appColor : Colors.transparent, width: 2),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/a_man.png',
                                        ),
                                        fit: BoxFit.cover)),
                              )),
                          height: 134,
                          width: 134,
                        )),
                      ),
                      Align(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, left: 75),
                          width: 20,
                          height: 25,
                          child: Checkbox(
                            activeColor: UtilsVariables.appColor,
                            value: selectAll,
                            onChanged: (value) {
                              selectAll = !selectAll;
                              setState(() {});
                            },
                            shape: CircleBorder(),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ],
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
            child: BiggerPicture(
              imageName: imageName,
            ),
          );
        });
  }
}
