import 'package:flutter/material.dart';
import 'package:gnexus/presentation/screens/family_tree_screen/profile/settings.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';
import 'package:gnexus/presentation/widgets/profile_widgets/profile_person_details.dart';

import 'my_plan.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String mainPart = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppBar(titleDropDown: "Profile",),),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      sectionProfile('Profile', 'assets/man_profile.png'),
                      sectionProfile('My plan', 'assets/my_plan.png'),
                      sectionProfile('Settings', 'assets/settings.png'),
                    ],
                  ),
                  (mainPart == "Profile")
                      ? Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              ProfilePersonDetail(),
                              SecurityProfile(),
                            ],
                          ))
                      : (mainPart == "My plan")
                          ? SingleChildScrollView(child: MyPlan())
                          : Setting(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionProfile(String description, String image) {
    return InkWell(
      onTap: () {
        mainPart = description;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                mainPart == description ? Color(0xffE6E6F3) : Color(0xd00000d),
            borderRadius: BorderRadius.circular(6)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              image,
              color: mainPart == description ? Color(0xff000080) : Colors.black,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              description,
              style: TextStyle(
                  color: mainPart == description
                      ? Color(0xff000080)
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  // Widget informationOwnerProfile() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6),
  //       color: Color(0xffF9F9F9),
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           children: [
  //             Icon(Icons.person),
  //             Text("Personal details"),
  //             Spacer(),
  //             Icon(Icons.edit),
  //             Text("Edit"),
  //             SizedBox(
  //               width: 10,
  //             ),
  //           ],
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

  Widget SecurityProfile() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xffF9F9F9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.lock_outline),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Security"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: Text("Change password")),
                  Text("|"),
                  TextButton(onPressed: () {}, child: Text("Reset Password"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
