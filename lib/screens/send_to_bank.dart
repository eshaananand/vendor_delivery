// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/api_providers/user_data_provider.dart';
import 'package:vendor_delivery/api_providers/verify_otp_provider.dart';
import 'package:vendor_delivery/screens/payment_successful.dart';

class SendBank extends StatefulWidget {
  SendBank({Key? key}) : super(key: key);

  @override
  State<SendBank> createState() => _SendBankState();
}

class _SendBankState extends State<SendBank> {
  late UserDataProvider userDataProvider;
  late VerifyOtpProvider verifyOtpProvider;
  TextEditingController nameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  double h(double height) {
    return MediaQuery.of(context).size.height * height;
  }

  double w(double width) {
    return MediaQuery.of(context).size.width * width;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    verifyOtpProvider = Provider.of<VerifyOtpProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                          "Send to Bank",
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
              Container(
                // height: h(0.8),
                width: w(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage("assets/user_profile.png"),
                      color: Colors.red,
                      size: h(0.1),
                    ),
                    Text(
                      "Yout balance Rs. 0",
                      style: TextStyle(fontSize: 15),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 30.0, bottom: 30),
                    //   child: Text(
                    //     "Rs 500",
                    //     style: TextStyle(
                    //         fontSize: 30,
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Container(
                    //   width: w(0.3),
                    //   child: TextFormField(
                    //     style: TextStyle(
                    //       fontSize: 30,
                    //       color: Colors.red,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     keyboardType: TextInputType.number,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: "Rs 500",
                    //       hintStyle: TextStyle(
                    //         fontSize: 30,
                    //         color: Colors.red,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Name:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintText: "Enter your name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Account number:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: accountNumberController,
                            decoration: InputDecoration(
                              hintText: "Enter your account number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "IFSC Code:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: ifscCodeController,
                            decoration: InputDecoration(
                              hintText: "Enter your IFSC code",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Bank Name:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: bankNameController,
                            decoration: InputDecoration(
                              hintText: "Enter your Bank name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Phone number:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Amount:",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: amountController,
                            decoration: InputDecoration(
                              hintText: "Enter your amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            onChanged: (value) => {
                              setState(() {}),
                            },
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        userDataProvider.withdDrawMoneyApi(
                            context: context,
                            name: nameController.text,
                            accountNO: accountNumberController.text,
                            ifcs: ifscCodeController.text,
                            bankName: bankNameController.text,
                            phoneNo: phoneNumberController.text,
                            amount: amountController.text,
                            ridersId: verifyOtpProvider.ridersId,
                            token: verifyOtpProvider.authToken);

                        pushNewScreen(
                          context,
                          screen: PaymentSuccessful(
                            text: "REQUEST SENT",
                            altText: "You will be notified once your \nrequest is completed ",
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 60,
                        width: 170,
                        child: Card(
                          color: Colors.red,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Send Now",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
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
