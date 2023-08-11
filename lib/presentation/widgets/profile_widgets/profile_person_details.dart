import 'package:flutter/material.dart';

class ProfilePersonDetail extends StatelessWidget {
  const ProfilePersonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xffF9F9F9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 8,),
                  Text("Personal details"),
                  Spacer(),
                  Icon(Icons.edit),
                  SizedBox(width: 8,),
                  Text("Edit"),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(2), // Border radius
                  child: ClipOval(child: Image.asset("assets/user_photo.png")),
                ),
              ),

              SizedBox(width: 6,),

              Text('John Doe'),
              Text('@johndoe'),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email'),
                  Text('Gender'),
                ],
              ),
              SizedBox(
                height: 6,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('johndoe@gmail.com'),
                  Text('Male'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Phone number'),
                  Text('Date of birth'),
                ],
              ),
              SizedBox(
                height: 6,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('+998991234567'),
                  Text('04/June/1998'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location'),
                  Text('Marital status'),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tashkent, Uzbekistan'),
                  Text('Not married'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('Bio'),

              SizedBox(height: 20,),
              Text("It is a long established fact thatint"),


            ],
          ),
        ),
      ),

    );

  }
}