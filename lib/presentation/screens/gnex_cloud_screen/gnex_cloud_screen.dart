import 'package:flutter/material.dart';
import 'package:gnexus/presentation/widgets/appbar_menu/custom_appbar.dart';

import '../../../utils/utils_variable/variables.dart';

class GnexCloudScreen extends StatefulWidget {
  const GnexCloudScreen({Key? key}) : super(key: key);

  @override
  State<GnexCloudScreen> createState() => _GnexCloudScreenState();
}

class _GnexCloudScreenState extends State<GnexCloudScreen> {
  @override
  void initState() {
    handleContainerTap(0);
    super.initState();
  }

  int selectedContainerIndex = -1;

  // Define colors for the containers
  final List<Color> containerColors = [
    Color(0xd00000d),
    Color(0xd00000d),
    Color(0xd00000d),
    Color(0xd00000d),
  ];
  final List<Color> colorIcon = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  // Function to handle container tap
  void handleContainerTap(int index) {
    setState(() {
      // Reset the previous selection to white
      if (selectedContainerIndex != -1) {
        containerColors[selectedContainerIndex] = Color(0xd00000d);
        colorIcon[selectedContainerIndex] = Colors.black;
      }

      containerColors[index] = Color(0xffE6E6F3);
      colorIcon[index] = Color(0xff000080);
      selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          titleDropDown: "Name",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: Color(0xff104CC0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Upload File",
                          style: TextStyle(
                            color: Color(0xff104CC0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.sync,
                    color: Color(0xff000080),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xd104cc0)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff104CC0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Last week",
                          style: TextStyle(
                            color: Color(0xff104CC0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => handleContainerTap(0),
                    child: Container(
                      decoration: BoxDecoration(color: containerColors[0], borderRadius: BorderRadius.circular(8)),
                      width: 105,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort,
                            color: colorIcon[0],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'All files',
                            style: TextStyle(
                              color: colorIcon[0],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleContainerTap(1),
                    child: Container(
                      decoration: BoxDecoration(color: containerColors[1], borderRadius: BorderRadius.circular(8)),
                      width: 105,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort_by_alpha_rounded,
                            color: colorIcon[1],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Video',
                            style: TextStyle(
                              color: colorIcon[1],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => handleContainerTap(2),
                    child: Container(
                      width: 105,
                      height: 32,
                      decoration: BoxDecoration(color: containerColors[2], borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.audio_file,
                            color: colorIcon[2],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Audios',
                            style: TextStyle(
                              color: colorIcon[2],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () => handleContainerTap(3),
                child: Container(
                  width: 105,
                  height: 32,
                  decoration: BoxDecoration(color: containerColors[3], borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_copy_outlined,
                        color: colorIcon[3],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Others',
                        style: TextStyle(
                          color: colorIcon[3],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(height: 400, child: audioFile()),
              Container(height: 250, child: videoFile()),
            ],
          ),
        ),
      ),
    );
  }

  Widget allFile() {
    return Column(
      children: [],
    );
  }

  Widget audioFile() {
    return GridView.count(
      crossAxisCount: 2, // Number of columns in the grid
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(4, (index) {
        return Container(
          height: 186,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF3F6FC)),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    size: 16,
                    color: Colors.red,
                  ),
                  Text(
                    "Texting- Appointment",
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 16,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: 138,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/Rectangle 3467321.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget videoFile() {
    return GridView.count(
      crossAxisCount: 2, // Number of columns in the grid
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: List.generate(4, (index) {
        return Container(
          height: 186,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xffF3F6FC)),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 16,
                    color: Colors.blue,
                  ),
                  Text(
                    "Happy Eid",
                    style: TextStyle(fontSize: 12),
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 16,
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  width: 138,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/Rectangle 3467321 (1).png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
