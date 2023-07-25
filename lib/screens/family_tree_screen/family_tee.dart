import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gnexus/widgets/custom/custom_button.dart';

import '../../utils/utils_variable/variables.dart';

class FamilyTree extends StatefulWidget {
  const FamilyTree({Key? key}) : super(key: key);

  @override
  State<FamilyTree> createState() => _FamilyTreeState();
}

class _FamilyTreeState extends State<FamilyTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(UtilsVariables.userName),
            RotatedBox(
                quarterTurns: 3, child: Icon(Icons.arrow_back_ios_rounded))
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
      body: Padding(

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
