import 'package:flutter/material.dart';
import 'package:gnexus/data/models/notification/notification_data.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

class NotificationsDetailsScreen extends StatelessWidget {
  const NotificationsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          titleDropDown: "Profile",
        ),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Events",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'SF Pro Display'),
                ),
                InkWell(
                  onTap: () => {
                    PopupMenuButton
                  },
                  child: Card(
                    color: Color(0xFFECEFF8),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 8, 20, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.indigo,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Filter',
                            style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: NotificationListView())
      ]),
    );
  }
}

class NotificationListView extends StatelessWidget {
  NotificationListView({Key? key}) : super(key: key);

  final List<NotificationData> items = [
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    NotificationData(
      id: 1,
      img: "assets/robot.png",
      title: "Today is the Robot’s Celebrity day",
      subTitle: "1 day ago",
    ),
    // Add more items as needed
  ];

  void _handleItemClick(BuildContext context, int index) {
    // Handle the click event for the item at the given index
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Clicked'),
          content: Text('You clicked on ${index}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 3, bottom: 3),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: Color(0xFFECEFF8),
            child: InkWell(
              onTap: () => _handleItemClick(context, index),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${items[index].title}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${items[index].subTitle}",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                leading: SizedBox(
                  width: 40,
                  child: Image.asset(
                    "${items[index].img}",
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}