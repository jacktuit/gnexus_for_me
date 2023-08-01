import 'package:flutter/material.dart';


class NotificationsDetailsScreen extends StatelessWidget {
  const NotificationsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child:
          ListTile(
            leading: Icon(
              Icons.circle,
              weight: 8,
              color: Colors.indigo,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(2), // Border radius
                    child: ClipOval(
                        child: Image.asset("assets/user_photo.png")),
                  ),
                ),
                Text(
                    "Jasur requested make public your gallery for him", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            subtitle: Text('Jul 23 , 2023 at 9:15'),
          ),

          // ListView.builder(
          //
          //     padding: const EdgeInsets.all(8),
          //     itemCount: 5,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //         height: 70,
          //         width: double.infinity,
          //         color: Colors.black12,
          //         decoration:
          //             BoxDecoration(borderRadius: BorderRadius.circular(6)),
          //         child: ListTile(
          //           leading: Icon(
          //             Icons.circle,
          //             weight: 8,
          //             color: Colors.indigo,
          //           ),
          //           title: Column(
          //             children: [
          //               CircleAvatar(
          //                 radius: 24,
          //                 backgroundColor: Colors.black,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2), // Border radius
          //                   child: ClipOval(
          //                       child: Image.asset("assets/cloud.png")),
          //                 ),
          //               ),
          //               Text(
          //                   "Jasur requested make public your gallery for him"),
          //             ],
          //           ),
          //           subtitle: Text('Jul 23 , 2023 at 9:15'),
          //         ),
          //       );
          //     }),
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
