import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomSwitch extends StatefulWidget {
  final String? title;
  final bool? switchValue;
  const CustomSwitch({this.title, this.switchValue , super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title??'',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Semantics(
            container: true,
            child: Column(
              children: <Widget>[
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Colors.indigo,
                    value: _switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}