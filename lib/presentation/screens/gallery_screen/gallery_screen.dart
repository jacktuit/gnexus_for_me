import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          titleDropDown: "Profile",
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gallery",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xd104cc0)),
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      color: Color(0xff104CC0),
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(color: Color(0xff104CC0)),
                    )
                  ],
                ),
              )
            ],
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between columns
            ),
            itemCount: 10, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Item $index'),
                ),
              );
            },
          )


        ],
      ),
    );
  }
}
