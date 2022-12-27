// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  bool isOnline = false;
  String currentStatus = "Offline";
  String statusChangesTo = "Online";

  int star = 3; //1 <= star <= 5 , tells the number of star of the driver

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        key: _key,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                  height: 200,
                  color: HexColor("#BDD9D9D9"),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            _key.currentState!.closeDrawer();
                          },
                          icon: Icon(Icons.close, color: Colors.red, size: 30),
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 80,
                                child: Image.asset("assets/user_profile.png")),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Swayman Verma",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "+91 1234567890",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.57)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 2),
                                  child: Text(
                                    "swaymverma@gmail.com",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.57)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: star >= 1
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: star >= 2
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: star >= 3
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: star >= 4
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: star >= 5
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              DrawerWidget()
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: h(0.058),
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[4],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () => _key.currentState!.openDrawer(),
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "You're $currentStatus",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 90.0),
                          child: InkWell(
                            onTap: () {
                              isOnline = !isOnline;

                              if (isOnline) {
                                currentStatus = "Online";
                                statusChangesTo = "Offline";

                                setState(() {});
                              } else {
                                statusChangesTo = "Online";
                                currentStatus = "Offline";

                                setState(() {});
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Go $statusChangesTo",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Stack(
                  children: [
                    Container(
                      height: h(0.8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/chatMapBackground.png",
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h(0.62)),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "64",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Orders",
                                      style: TextStyle(
                                        // fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "164km",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Ride",
                                      style: TextStyle(
                                        // fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "Rs.5000",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Earning",
                                      style: TextStyle(
                                        // fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
