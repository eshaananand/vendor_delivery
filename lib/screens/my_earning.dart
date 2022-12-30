// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/api_providers/user_data_provider.dart';

class MyEarning extends StatefulWidget {
  MyEarning({Key? key}) : super(key: key);

  @override
  State<MyEarning> createState() => _MyEarningState();
}

class _MyEarningState extends State<MyEarning> {
//Controls string below send to back

  late UserDataProvider userDataProvider;
  String filterText = "Recent";

  int modelBottomSheetSelectedButton = 1;

  List<String> type = ["Cashback"];
  List<String> date = ["24 August"];
  List<String> time = ["11:00am"];
  List<String> amount = ["200"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
  }

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
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          "My Earning",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30.0, bottom: 5),
                          child: Text(
                            "My Earning",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Text(
                          "Rs ${userDataProvider.myEarnings}",
                          style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w(0.07), vertical: h(0.07)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    filterText,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.69),
                                      fontSize: 20,
                                    ),
                                  ),
                                  // ImageIcon(onPressed: () {}, icon: Icon(Icons.filter))
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet<void>(
                                        context: context,
                                        builder: (
                                          BuildContext context,
                                        ) {
                                          return StatefulBuilder(builder: (BuildContext context, StateSetter set) {
                                            return SizedBox(
                                              height: h(0.3),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          icon: modelBottomSheetSelectedButton == 1
                                                              ? Icon(Icons.radio_button_checked, color: Colors.red)
                                                              : Icon(Icons.circle_outlined),
                                                          onPressed: () {
                                                            set(() {
                                                              filterText = "Recent";
                                                              modelBottomSheetSelectedButton = 1;
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
                                                          icon: modelBottomSheetSelectedButton == 2
                                                              ? Icon(Icons.radio_button_checked, color: Colors.red)
                                                              : Icon(Icons.circle_outlined),
                                                          onPressed: () {
                                                            set(() {
                                                              filterText = "Past Week";
                                                              modelBottomSheetSelectedButton = 2;
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
                                                          icon: modelBottomSheetSelectedButton == 3
                                                              ? Icon(Icons.radio_button_checked, color: Colors.red)
                                                              : Icon(Icons.circle_outlined),
                                                          onPressed: () {
                                                            set(() {
                                                              filterText = "Past Month";
                                                              modelBottomSheetSelectedButton = 3;
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
                                                          icon: modelBottomSheetSelectedButton == 4
                                                              ? Icon(
                                                                  Icons.radio_button_checked,
                                                                  color: Colors.red,
                                                                )
                                                              : Icon(Icons.circle_outlined),
                                                          onPressed: () {
                                                            set(() {
                                                              filterText = "Past Year";
                                                              modelBottomSheetSelectedButton = 4;
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
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(minHeight: 56.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: type.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  type[index],
                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 8.0),
                                                  child: Text(
                                                    '${date[index]}, ${time[index]}',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Rs ${amount[index]}",
                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ));
                                  },
                                ),
                              )
                            ],
                          ),
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
    );
  }
}
