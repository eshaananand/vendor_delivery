// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_delivery/screens/home.dart';
import 'package:vendor_delivery/screens/support.dart';

import 'chatBox.dart';
import 'delivered_successfully.dart';

class TrackLocation extends StatefulWidget {
  TrackLocation({Key? key}) : super(key: key);

  @override
  State<TrackLocation> createState() => _TrackLocationState();
}

class _TrackLocationState extends State<TrackLocation> {
  int numberOfTimesNavBarisTapped = 0;
  String currentStatus = "Accecpt Delivery";

  Widget currentOrders(
    BuildContext context, {
    String image = "",
    String type = "",
    String distance = "",
    String time = "",
    String storeName = "",
    String storeAddress = "",
    String deliverTo = "",
    String destinationAddress = "",
  }) {
    return Container(
        height: 160,
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
                  borderRadius: BorderRadius.circular(10),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (numberOfTimesNavBarisTapped > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/entypo_direction.png"),
                                Text(
                                  "Direction",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    "$distance, $time",
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(storeName, style: TextStyle(fontSize: 14)),
                            Text(
                              storeAddress,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        if (numberOfTimesNavBarisTapped > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: GestureDetector(
                                    onTap: () {
                                      pushNewScreen(context, screen: ChatBox());
                                    },
                                    child:
                                        Icon(Icons.message, color: Colors.red)),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(Icons.call, color: Colors.red),
                                ),
                              ),
                            ],
                          ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              deliverTo,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              destinationAddress,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        if (numberOfTimesNavBarisTapped > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: GestureDetector(
                                    onTap: () {
                                      pushNewScreen(context, screen: ChatBox());
                                    },
                                    child:
                                        Icon(Icons.message, color: Colors.red)),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Icon(Icons.call, color: Colors.red),
                                ),
                              ),
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

  Widget groceryList({
    String type = "",
    String weight = "",
    String quantity = "",
    String totalPrice = "",
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(type),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("$weight x $quantity"), Text("Rs. $totalPrice")],
            ),
          )
        ],
      ),
    );
  }

  List<int> paymentAmount = [190, 10, 10, 10];

  Widget payment({
    required String paymentType,
    required int amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(paymentType), Text("Rs. $amount")],
    );
  }

  @override
  Widget build(BuildContext context) {
    double h(double height) {
      return MediaQuery.of(context).size.height * height;
    }

    double w(double width) {
      return MediaQuery.of(context).size.width * width;
    }

    //If this = 1 then the bottom nav bar is tapped once
    //It will be used to tell how many times nav bar is tapped
    //And accordingly the nav bar will behave

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              print(numberOfTimesNavBarisTapped);
              numberOfTimesNavBarisTapped += 1;
              if (numberOfTimesNavBarisTapped == 1) {
                currentStatus = "Mark As Picked";
                setState(() {});
              } else if (numberOfTimesNavBarisTapped == 2) {
                currentStatus = "Mark As Delivered";
                setState(() {});
              } else {
                pushNewScreen(context, screen: DeliveredSuccessful());
              }
            },
            child: SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  currentStatus,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "New Delivery Task",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          ),
                        ),
                        if (numberOfTimesNavBarisTapped > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 282,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 40, 20),
                                              child: Column(
                                                children: [
                                                  groceryList(
                                                    type: "Fresh Potato",
                                                    weight: "2kg",
                                                    quantity: "1",
                                                    totalPrice: "50",
                                                  ),
                                                  groceryList(
                                                    type: "Fresh Potato",
                                                    weight: "2kg",
                                                    quantity: "1",
                                                    totalPrice: "50",
                                                  ),
                                                  groceryList(
                                                    type: "Fresh Potato",
                                                    weight: "2kg",
                                                    quantity: "1",
                                                    totalPrice: "50",
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                color: Colors.red,
                                                width: w(1),
                                                height: 50,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Cash on Delivery",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Rs. 200",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 30,
                                width: 110,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/shopping_bag.png"),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "Order Info",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: w(0.06), vertical: h(0.03)),
              //   child: currentOrders(
              //     context,
              //     type: "Vegetables & Fruits",
              //     image: "assets/vegetable.png",
              //     date: "24 August",
              //     time: "11:00AM",
              //     status: "Pickup Arranged",
              //     storeName: "Tripathi Store",
              //     to: "Home",
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h(0.05)),
                child: Container(
                  height: h(0.45),
                  width: w(1),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Text("Google map here"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w(0.06), vertical: h(0.03)),
                child: currentOrders(
                  context,
                  type: "Vegetables & Fruits",
                  image: "assets/vegetable.png",
                  distance: "24 August",
                  time: "11:00AM",
                  storeName: "Tripathi Store",
                  storeAddress: "South 24 Parganas, Dover Lane",
                  deliverTo: "Virat Verma",
                  destinationAddress: "234 Purabanchal School Road",
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(w(0.02), h(0.02), w(0.02), 0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Image.asset("assets/user.png", height: 50),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Swayam Verma",
              //             style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             "Delivery Partner",
              //             style: TextStyle(
              //               fontSize: 10,
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //       IconButton(
              //         icon: Icon(Icons.support_agent_outlined),
              //         color: Colors.red,
              //         onPressed: () {
              //           pushNewScreen(context, screen: Support());
              //         },
              //         iconSize: 30,
              //       ),
              //       IconButton(
              //         icon: Icon(Icons.message),
              //         color: Colors.red,
              //         onPressed: () {
              //           pushNewScreen(context, screen: ChatBox());
              //         },
              //         iconSize: 30,
              //       ),
              //       IconButton(
              //         icon: Icon(Icons.call),
              //         color: Colors.red,
              //         onPressed: () {},
              //         iconSize: 30,
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(
              //       vertical: h(0.02), horizontal: w(0.08)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("3 items"),
              //       SizedBox(
              //         height: 40,
              //         width: 110,
              //         child: InkWell(
              //           onTap: () {
              //             showModalBottomSheet(
              //               isScrollControlled: true,
              //               context: context,
              //               builder: (context) {
              //                 return SizedBox(
              //                   child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     children: <Widget>[
              //                       Padding(
              //                         padding: EdgeInsets.fromLTRB(
              //                             w(0.02), h(0.02), w(0.02), 0),
              //                         child: Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceEvenly,
              //                           children: [
              //                             Image.asset("assets/user.png",
              //                                 height: 50),
              //                             Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Text(
              //                                   "Swayam Verma",
              //                                   style: TextStyle(
              //                                     fontSize: 18,
              //                                     fontWeight: FontWeight.bold,
              //                                   ),
              //                                 ),
              //                                 Text(
              //                                   "Delivery Partner",
              //                                   style: TextStyle(
              //                                     fontSize: 10,
              //                                     color: Colors.grey,
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                             IconButton(
              //                               icon: Icon(Icons.message),
              //                               color: Colors.red,
              //                               onPressed: () {
              //                                 pushNewScreen(context,
              //                                     screen: ChatBox());
              //                               },
              //                               iconSize: 30,
              //                             ),
              //                             IconButton(
              //                               icon: Icon(Icons.call),
              //                               color: Colors.red,
              //                               onPressed: () {},
              //                               iconSize: 30,
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              // Padding(
              //   padding:
              //       EdgeInsets.fromLTRB(20, 20, 40, 20),
              //   child: Column(
              //     crossAxisAlignment:
              //         CrossAxisAlignment.start,
              //     children: [
              //       groceryList(
              //         type: "Fresh Potato",
              //         weight: "2kg",
              //         quantity: "1",
              //         totalPrice: "50",
              //       ),
              //       groceryList(
              //         type: "Fresh Potato",
              //         weight: "2kg",
              //         quantity: "1",
              //         totalPrice: "50",
              //       ),
              //       groceryList(
              //         type: "Fresh Potato",
              //         weight: "2kg",
              //         quantity: "1",
              //         totalPrice: "50",
              //       ),
              //     ],
              //   ),
              // ),
              //                       Container(
              //                         color:
              //                             HexColor("D9D9D9").withOpacity(0.42),
              //                         child: Padding(
              //                           padding: EdgeInsets.only(
              //                               left: 20.0, right: 30),
              //                           child: Column(
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: [
              //                               Text(
              //                                 "Payment Info",
              //                                 style: TextStyle(
              //                                     fontSize: 18.0,
              //                                     fontWeight: FontWeight.bold),
              //                               ),
              //                               Container(
              //                                 height: 130,
              //                                 child: ListView.builder(
              //                                   // physics:
              //                                   //     NeverScrollableScrollPhysics(),
              //                                   itemCount: 4,
              //                                   itemBuilder:
              //                                       (BuildContext context,
              //                                           int index) {
              //                                     return Padding(
              //                                       padding: const EdgeInsets
              //                                           .fromLTRB(0, 15, 40, 0),
              //                                       child: payment(
              //                                         amount:
              //                                             paymentAmount[index],
              //                                         paymentType:
              //                                             paymentType[index],
              //                                       ),
              //                                     );
              //                                   },
              //                                 ),
              //                               ),
              //                               Divider(
              //                                 color: HexColor("000000")
              //                                     .withOpacity(0.56),
              //                                 thickness: 4,
              //                               ),
              //                               Padding(
              //                                 padding: EdgeInsets.only(
              //                                     left: 20.0, right: 50),
              //                                 child: Row(
              //                                   mainAxisAlignment:
              //                                       MainAxisAlignment
              //                                           .spaceBetween,
              //                                   children: [
              //                                     Text(
              //                                       "Total",
              //                                       style:
              //                                           TextStyle(fontSize: 18),
              //                                     ),
              //                                     Text(
              //                                       "Rs. 200",
              //                                       style:
              //                                           TextStyle(fontSize: 18),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               ),
              //                               Row(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment
              //                                         .spaceBetween,
              //                                 children: [
              //                                   Text("3 items"),
              //                                   Padding(
              //                                     padding: EdgeInsets.only(
              //                                         top: 30.0, bottom: 30),
              //                                     child: SizedBox(
              //                                       height: 40,
              //                                       width: 80,
              //                                       child: Card(
              //                                         elevation: 5,
              //                                         shape:
              //                                             RoundedRectangleBorder(
              //                                           borderRadius:
              //                                               BorderRadius
              //                                                   .circular(10),
              //                                         ),
              //                                         child: InkWell(
              //                                           onTap: () {
              //                                             Navigator.pop(
              //                                                 context);
              //                                           },
              //                                           child: Container(
              //                                             decoration:
              //                                                 BoxDecoration(
              //                                               borderRadius:
              //                                                   BorderRadius
              //                                                       .circular(
              //                                                           10),
              //                                               color: Colors.red,
              //                                             ),
              //                                             child: Center(
              //                                               child: Row(
              //                                                 children: [
              //                                                   Padding(
              //                                                     padding: const EdgeInsets
              //                                                             .only(
              //                                                         left:
              //                                                             8.0),
              //                                                     child: Text(
              //                                                       "Close",
              //                                                       style: TextStyle(
              //                                                           color: Colors
              //                                                               .white,
              //                                                           fontWeight:
              //                                                               FontWeight.bold),
              //                                                     ),
              //                                                   ),
              //                                                   Icon(
              //                                                       Icons
              //                                                           .keyboard_arrow_down_rounded,
              //                                                       color: Colors
              //                                                           .white)
              //                                                 ],
              //                                               ),
              //                                             ),
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ],
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //             );
              //           },
              //           child: Card(
              //             elevation: 5,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: Colors.red,
              //               ),
              //               child: Center(
              //                 child: Row(
              //                   children: [
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 8.0),
              //                       child: Text(
              //                         "View Cart",
              //                         style: TextStyle(
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.bold),
              //                       ),
              //                     ),
              //                     Icon(Icons.keyboard_arrow_down_rounded,
              //                         color: Colors.white)
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
