import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/custom/custom_switch.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
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
                      Icons.notifications_none,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Notification Settings",
                      style: TextStyle(color: Colors.indigo, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSwitch(title: "Events", switchValue: false),
                Text(
                  'Notifications for famliy events like birthdays and others',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSwitch(title: "Invitation", switchValue: false),
                Text(
                  'Notifications for famliy events like birthdays and others',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomSwitch(title: "System", switchValue: false),
                Text(
                  'System notifications',
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
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
                      Icons.cloud_outlined,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Public data",
                      style: TextStyle(color: Colors.indigo, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    "You can control your public and private data here. Your connections and members of your family tree can see your public data."),
                SizedBox(
                  height: 30,
                ),
                Text("Gallery"),
                SizedBox(
                  height: 20,
                ),
                CustomSwitch(title: "For all", switchValue: false),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Control for per member"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Gnexus Cloud"),
                SizedBox(
                  height: 20,
                ),
                CustomSwitch(title: "For all", switchValue: false),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Control for per member"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Family Tree"),
                SizedBox(
                  height: 20,
                ),
                CustomSwitch(title: "For all", switchValue: false),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Control for per member"),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
