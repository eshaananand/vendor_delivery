// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int onUpdate = 0;
  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {},
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h(0.3),
              width: w(1),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/friend_profile.png",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ImageIcon(
                      AssetImage("assets/pen.png"),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Swayam Verma",
                          suffixIcon: ImageIcon(
                            AssetImage("assets/pen.png"),
                            color: Colors.red,
                          ),
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Phone No",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "1234566788",
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0),
                        child: Text(
                          "Email",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "swayamverma2002@gmail.com",
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0, bottom: 10),
                        child: Text(
                          "Account No.",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Account name ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0, bottom: 10),
                        child: Text(
                          "Re-enter Account no:",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Account no. again",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35.0, bottom: 10),
                        child: Text(
                          "IFSC Code:",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your IFSC Code",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onChanged: (value) => {
                          onUpdate = 1,
                          setState(() {}),
                        },
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: InkWell(
                                onTap: () {
                                  onUpdate = 0;
                                  setState(() {});
                                },
                                child: onUpdate == 0
                                    ? Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.red,
                                          ),
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Update",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
