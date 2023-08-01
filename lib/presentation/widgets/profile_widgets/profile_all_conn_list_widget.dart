import 'package:flutter/material.dart';

class ProfileAllConnListWidget extends StatelessWidget {
  const ProfileAllConnListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2), // Border radius
              child: ClipOval(child: Image.asset("assets/cloud.png")),
            ),
          ),
          title: Text('Max Johnson'),
          trailing: Container(
            width: 35,
            height: 105,
            color: Colors.grey.shade200,
            child: Center(
              child: Row(
                children: [
                  Icon(Icons.chat, color: Colors.indigo,),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Remove')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}