import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/custom/custom_button.dart';
import 'package:gnexus/presentation/widgets/custom/custom_indicator.dart';

class MyPlan extends StatefulWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xffF9F9F9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.add_card_sharp,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "My plan",
                  style: TextStyle(color: Colors.indigo, fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Current activated plan',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Free plan',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {},
                title: "Upgrade plan",
                color: Color(0xff000080)),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Family tree size',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('45/500'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Storage Size GB',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  CustomIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text('45/500'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Generate tree charts',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Unavailable in plan',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Colorize photos',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Unavailable in plan',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enhance photos',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Unavailable in plan',
                    style: TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                  // SizedBox(height: 20,),
                  // Text(
                  //   'Generate family books',
                  //   style: TextStyle(fontSize: 14, color: Colors.black),
                  // ),
                  // SizedBox(height: 10,),
                  // Text(
                  //   'Unavailable in plan',
                  //   style: TextStyle(fontSize: 14, color: Colors.black45),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
