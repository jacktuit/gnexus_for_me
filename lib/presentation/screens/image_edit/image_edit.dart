import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({super.key});

  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          titleDropDown: "Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Row(children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(
                        width: 1,
                        color: Color(0x4D000080),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset("assets/selected_radio_button_icon.png", width: 15),
                          SizedBox(width: 10),
                          Text("Enhance Photo")
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(
                        width: 1,
                        color: Color(0x80D9D9D9),
                      ),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 18, right: 18),
                      child: Row(
                        children: [
                          Image.asset("assets/unselected_radio_button_icon.png", width: 15),
                          SizedBox(width: 10),
                          Text(
                            "Colorize Photo",
                            style: TextStyle(color: Color(0xFFD9D9D9)),
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        side: BorderSide(
                          width: 1,
                          color: Color(0x80D9D9D9),
                        ),
                      ),
                      color: Color(0xFF104CC0),
                      child: InkWell(
                        onTap: () => {_dialogBuilder(context)},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 24, right: 24),
                          child: Row(
                            children: [
                              Image.asset("assets/download_icon.png", width: 15),
                              SizedBox(width: 10),
                              Text(
                                "Upload Image",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 15, right: 10),
                child: Row(children: [
                  Image.asset("assets/attention.png", width: 18),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Info about enhancer",
                      style: TextStyle(color: Color(0xFF000080)),
                    ),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(children: [
                  Text(
                    "AI Enhance Image Quality & Resolution",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Row(children: [
                  Expanded(
                    child: Text(
                      "This tool offers a one-click  AI solution to making image high quality. Just in seconds, the photo enhancer helps automatically enhance photo resolution,sharpen detail, and adjust color. Try it to enhance picture quality online now! Or,download the image enhancement software.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Info about enhancer"), Icon(Icons.cancel_outlined)],
              ),
              Row(
                children: [
                  Icon(Icons.cancel_outlined),
                  Column(
                    children: [
                      Text("One- Click Enhance "),
                      Container(
                        width: 300,
                        child: Text(
                            "With only one click to enhance your image and make images higher quality without any complex skills.",maxLines: 3,),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
