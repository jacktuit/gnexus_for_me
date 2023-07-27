import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gnexus/presentation/screens/family_tree_screen/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils_variable/variables.dart';
import '../../widgets/custom/custom_button.dart';
import '../sign/sign_in_screen.dart';


class FamilyTree extends StatefulWidget {
  const FamilyTree({Key? key}) : super(key: key);

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  String dropdownvalue = 'Name';
  bool changeProfile=false;
  var items = [
    'Name',
    'Profile',
    'Log out'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(UtilsVariables.userName),
            DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 20,),
                      Text(items,style: TextStyle(color:items=="Log out"?Colors.red:Colors.indigo ),),
                      SizedBox(width: 5,),
                      items=="Log out"?
                      Container(
                          width: 30,
                          child: Icon(Icons.login,color: Colors.red,)):Container(width: 0,height: 0,)
                    ],
                  ),
                );
              }).toList(),

              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  if (dropdownvalue=="Name"){
                    changeProfile=false;
                  }
                  if (dropdownvalue=="Profile"){
                    changeProfile=true;

                  }
                  if (dropdownvalue=="Log out"){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));
                  setState(() async{
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                  });

                  }
                });
              },
            ),
          ],
        ),
        actions: [
          Image.asset('assets/star.png'),
          SizedBox(
            width: 15,
          ),
          Image.asset("assets/globus.png"),
          SizedBox(
            width: 15,
          ),
          Image.asset("assets/Bell.png"),
          SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body:changeProfile?Profile(): Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Center(child: Image.asset("assets/Family_Tree.png")),


            Text(
              "You haven’t created family tree yet. Click button to create family tree",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0x9900000d),),
            ),

            CustomButton(onPressed: (){}, title: "Create family tree", color: Color(0xff000080))

          ],
        ),
      ),
    );
  }
}
