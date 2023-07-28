import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.white60,

              child: Padding(

                padding: const EdgeInsets.all(2), // Border radius
                child: ClipOval(child: Image.asset("assets/cloud.png")),
              ),
            ),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            RotatedBox(
                quarterTurns: 3, child: Icon(Icons.arrow_back_ios_rounded))
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
            Image.asset("assets/Bell.png"),
            SizedBox(
              width: 20,
            )
          ],
        )
      ],
    ));
  }
}
