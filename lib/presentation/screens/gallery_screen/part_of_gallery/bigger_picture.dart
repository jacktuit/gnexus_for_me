import 'package:flutter/material.dart';
class BiggerPicture extends StatelessWidget {
  final String imageName;
  const BiggerPicture({super.key, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Spacer(),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.cancel_outlined),
            SizedBox(
              width: 20,
            )
          ],
        ),
        Container(
            padding:
            EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            child: Image.asset(imageName))
      ],
    );
  }
}
