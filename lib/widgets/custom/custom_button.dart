import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool enabled;
  final void Function() onPressed;
  final String title;
  final Color color;
  double? height;
  double? width;

  CustomButton(
      {Key? key,
        this.enabled = true,
        required this.onPressed,
        required this.title, required this.color,this.height,this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0,right: 0),
      child: SizedBox(

        height: height,
        width: width,
        child: ElevatedButton(

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

          ),
          onPressed: enabled ? onPressed : null,
          child: enabled
              ? MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Text(title.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          )
              : CircularProgressIndicator(
            // valueColor: new AlwaysStoppedAnimation<Color>(
            //   Theme.of(context).primaryColor,
            // ),
          ),
        ),
      ),
    );
  }
}