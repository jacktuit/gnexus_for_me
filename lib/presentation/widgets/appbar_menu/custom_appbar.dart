import 'package:flutter/material.dart';
import 'package:gnexus/presentation/screens/bottom_navigation/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/family_tree_screen/profile/profile.dart';
import '../../screens/notifications_screens/notifications_details_screen.dart';
import '../../screens/sign/sign_in_screen.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key, this.titleDropDown}) : super(key: key);
  late String? titleDropDown;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  String dropdownValue = "Name";

  @override
  void initState() {
    super.initState();
  }

  var items = ['Name', 'Profile', 'Log out'];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // CircleAvatar(
              //   radius: 32,
              //   backgroundColor: Colors.white60,
              //
              //   child: Padding(
              //
              //     padding: const EdgeInsets.all(2), // Border radius
              //     child: ClipOval(child: Image.asset("assets/cloud.png")),
              //   ),
              // ),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(2), // Border radius
                  child: ClipOval(child: Image.asset("assets/user_photo.png")),
                ),
              ),
              SizedBox(width: 5,),
              DropdownButton(
                value: "${widget.titleDropDown ?? ''}",
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 10,),
                        Text(items, style: TextStyle(color: items == "Log out"
                            ? Colors.red
                            : Colors.indigo),),
                        SizedBox(width: 5,),
                        items == "Log out"
                            ?
                        Container(
                            width: 30,
                            child: Icon(Icons.login, color: Colors.red,))
                            : Container(width: 0, height: 0,)
                      ],
                    ),
                  );
                }).toList(),

                onChanged: (String? newValue) {
                  setState(() {
                    print(widget.titleDropDown);
                    widget.titleDropDown = newValue!;
                    if (widget.titleDropDown == "Name") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(selectedIndex: 0)),
                      );
                    }
                    if (widget.titleDropDown == "Profile") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                      );
                    }
                    if (widget.titleDropDown == "Log out") {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen()));
                      setState(() async {
                        final SharedPreferences prefs = await SharedPreferences
                            .getInstance();
                        prefs.clear();
                      });
                    }
                  });
                },
              ),

            ],
          ),
          Row(
            children: [
              Image.asset('assets/star.png'),
              SizedBox(
                width: 15,
              ),
              Image.asset("assets/globus.png"),
              SizedBox(
                width: 15,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NotificationsDetailsScreen()));
                  },
                  child: Image.asset("assets/Bell.png")),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
