// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/trackOrderLocation%20copy.dart';

class OrderHistory extends StatefulWidget {
  OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
//current orders
  List<String> currentImage = [
    "assets/vegetable.png",
    "assets/vegetable.png",
    "assets/vegetable.png"
  ];

  List<String> currentType = [
    "Vegetables and Fruits",
    "Vegetables and Fruits",
    "Vegetables and Fruits"
  ];

  List<String> currentDate = ["24 August", "24 August", "24 August"];

  List<String> currentTime = ['11:00 am', '11:00 am', '11:00 am'];

  List<String> currentStoreName = [
    "Tripathi Store",
    "Tripathi Store",
    "Tripathi Store"
  ];

  List<String> currentTo = ["Home", "Home", "Home"];

  List<String> currentStatus = [
    "Pickup Arranged",
    "Pickup Arranged",
    "Pickup Arranged"
  ];

//past orders
  List<String> pastImage = ["assets/vegetable.png"];

  List<String> pastType = ["Vegetables and Fruits"];

  List<String> pastDate = ["24 August"];

  List<String> pastTime = ['11:00 am'];

  List<String> pastStoreName = ["Tripathi Store"];

  List<String> pastTo = ["Home"];

  List<double> stars = [0];

  Widget currentOrders(
    BuildContext context, {
    GestureTapCallback? onTap,
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    String status = "",
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                // width: 60,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          type,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child:
                              Text(status, style: TextStyle(color: Colors.red)),
                        )
                      ],
                    ),
                    Text(
                      "$date, $time",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon(
                          //   Icons.arrow_drop_down,
                          //   color: Colors.red,
                          //   size: ,
                          // ),
                          Image.asset("assets/down_arrow.png"),
                          Text(storeName, style: TextStyle(fontSize: 14))
                        ],
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.red),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: Colors.red),
                          Text(
                            to,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget pastOrders(
    BuildContext context, {
    String image = "",
    String type = "",
    String date = "",
    String time = "",
    String storeName = "",
    String to = "",
    int index = 0,
  }) {
    return Container(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              // width: 60,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Delivered",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "$date, $time",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/down_arrow.png"),
                        Text(storeName, style: TextStyle(fontSize: 14))
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        Row(
                          children: [
                            Text(
                              to,
                              style: TextStyle(fontSize: 18),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: stars[index] != 0
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: stars[index] >= 2
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: stars[index] >= 3
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: stars[index] >= 4
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: stars[index] >= 5
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  String filterText = "Recent";

  int modelBottomSheetSelectedButton = 1;

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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "My Orders",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, top: 5),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (
                              BuildContext context,
                            ) {
                              return StatefulBuilder(builder:
                                  (BuildContext context, StateSetter set) {
                                return SizedBox(
                                  height: h(0.3),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton ==
                                                      1
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  filterText = "Recent";
                                                  modelBottomSheetSelectedButton =
                                                      1;
                                                });
                                                setState(() {});
                                              },
                                            ),
                                            Text("Recent")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton ==
                                                      2
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  filterText = "Past Week";
                                                  modelBottomSheetSelectedButton =
                                                      2;
                                                });
                                                setState(() {});
                                              },
                                            ),
                                            Text("Past Week")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon: modelBottomSheetSelectedButton ==
                                                      3
                                                  ? Icon(
                                                      Icons
                                                          .radio_button_checked,
                                                      color: Colors.red)
                                                  : Icon(Icons.circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  filterText = "Past Month";
                                                  modelBottomSheetSelectedButton =
                                                      3;
                                                });
                                                setState(() {});
                                              },
                                            ),
                                            Text("Past Month")
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              icon:
                                                  modelBottomSheetSelectedButton ==
                                                          4
                                                      ? Icon(
                                                          Icons
                                                              .radio_button_checked,
                                                          color: Colors.red,
                                                        )
                                                      : Icon(Icons
                                                          .circle_outlined),
                                              onPressed: () {
                                                set(() {
                                                  filterText = "Past Year";
                                                  modelBottomSheetSelectedButton =
                                                      4;
                                                });
                                                setState(() {});
                                              },
                                            ),
                                            Text("Past Year")
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          );
                        },
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset(
                            "assets/mi_filter.png",
                            color: Color.fromARGB(255, 252, 88, 88),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ORDER(S) IN PROCESS",
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 15),
                      child: Container(
                        height: currentType.length * 130,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: currentType.length,
                          itemBuilder: ((context, index) {
                            return currentOrders(
                              context,
                              onTap: () => {
                                pushNewScreen(
                                  context,
                                  screen: TrackLocation(),
                                  withNavBar: false,
                                ),
                              },
                              image: currentImage[index],
                              date: currentDate[index],
                              status: currentStatus[index],
                              storeName: currentStoreName[index],
                              time: currentTime[index],
                              to: currentTo[index],
                              type: currentType[index],
                            );
                          }),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "PAST ORDERS",
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 100, 100),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: pastType.length * 150,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pastType.length,
                        itemBuilder: ((context, index) {
                          return pastOrders(
                            context,
                            image: pastImage[index],
                            date: pastDate[index],
                            storeName: pastStoreName[index],
                            time: pastTime[index],
                            to: pastTo[index],
                            type: pastType[index],
                            index: index,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
