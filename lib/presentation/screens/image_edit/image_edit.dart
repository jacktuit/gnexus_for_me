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
                        children: [Image.asset("assets/selected_radio_button_icon.png", width: 15), SizedBox(width: 10), Text("Enhance Photo")],
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
                        onTap: () => {showCustomDialog(context)},
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
}

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Info about enhancer",
                      style: TextStyle(fontSize: 20, color: Color(0xFF000080)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      "assets/close.png",
                      width: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Image.asset("assets/one_click_enhance.png", width: 28),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "One- Click Enhance ", style: TextStyle( fontSize: 12, color: Color(0xFF000080)),
                        ),
                        RichText(
                           text: TextSpan(text: "With only one click to enhance your image and make images higher quality without any complex skills.",
                           style: TextStyle( fontSize: 10, color: Color(0xFF000080))),
                        ),
                      ],
                    )
                  )
                ]),
              )
            ],
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
