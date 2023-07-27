import 'package:flutter/material.dart';
class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xffF9F9F9),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.person),
              Text("Personal details"),
              Spacer(),
              Icon(Icons.edit),
              Text("Edit"),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );;
  }
}
