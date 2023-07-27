import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/appbar_menu.dart';

class NotificationsDetailsScreen extends StatelessWidget {
  const NotificationsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(2), // Border radius
                  child: ClipOval(child: Image.asset("assets/cloud.png")),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 15,
              ),
              RotatedBox(
                  quarterTurns: 3, child: Icon(Icons.arrow_back_ios_rounded))
            ],
          ),
        ),
        actions: [
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
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.black12,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(6)),
                  child: ListTile(
                    leading: Icon(
                      Icons.circle,
                      weight: 8,
                      color: Colors.indigo,
                    ),
                    title: Column(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(2), // Border radius
                            child: ClipOval(
                                child: Image.asset("assets/cloud.png")),
                          ),
                        ),
                        Text(
                            "Jasur requested make public your gallery for him"),
                      ],
                    ),
                    subtitle: Text('Jul 23 , 2023 at 9:15'),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Delete notifications")
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.done,
                  color: Colors.indigoAccent,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Delete notifications",
                  style: TextStyle(color: Colors.indigoAccent),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
