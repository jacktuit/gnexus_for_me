import 'package:flutter/material.dart';


class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 10,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius:
          BorderRadius.circular(10)),
      child: FractionallySizedBox(
        // heightFactor: 2,
        widthFactor: 0.8,
        child: Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius:
              BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
