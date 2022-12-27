import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor_delivery/api_providers/send_otp_provider.dart';
import 'package:vendor_delivery/screens/login2.dart';
import '../components/common_widgets.dart';

class LoginPage1 extends StatelessWidget {
  LoginPage1({Key? key}) : super(key: key);
  TextEditingController numberController = TextEditingController();

  // void login(String number, BuildContext context) async {
  //   print("login $number");
  //   try {
  //     Response response = await post(
  //       Uri.parse('https://allinonevendor.herokuapp.com/v/sendOTP'),
  //       body: {'number': number},
  //     );
  //
  //     print("response: $response");
  //
  //     if (response.statusCode == 200) {
  //       print("OTP Sent successfully");
  //       // ignore: use_build_context_synchronously
  //       // Navigator.push(
  //       //     context,
  //       //     MaterialPageRoute(
  //       //         builder: (context) =>
  //       //             Otp(number: numberController.text.toString())));
  //     } else {
  //       print("Login failed");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<SendOtpProvider>(
  create: (context) => SendOtpProvider(),
    child: Consumer<SendOtpProvider>(
      builder: (_,prov,__) {
        return AbsorbPointer(
          absorbing: prov.isLoading,
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              const Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Log in with one of the following options",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  const Icon(
                                    Icons.facebook,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  Image.asset("assets/google.png"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "Phone No.:",
                                style: TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: numberController,
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter your phone number' : null,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        left: 15, bottom: 11, top: 11, right: 15),
                                    hintText: "Enter your phone number",
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25.0),
                                    )),
                              ),
                              const SizedBox(
                                width: 20.0,
                                height: 20.0,
                              ),
                              Center(
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 90,
                                    ),
                                    //Text("Have a ",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Have a ',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Refferal',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage2())),
                                          ),
                                          const TextSpan(
                                            text: ' Code ? ',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: MaterialButton(
                            //minWidth: double.infinity,
                            height: 60,
                            minWidth: 150,
                            onPressed: () async{
                              if(numberController.text.length==10){
                             await prov.sendOtp(number: numberController.text, context: context);}
                              else{
                                CommonWidgets().showSnackBar(
                                    context: context,
                                    color: Colors.red,
                                    title:numberController.text.isEmpty?"Please enter phone number":"Please add valid phone number!");
                              }
                              //login(numberController.text.toString(), context);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Otp(
                              //             // number:
                              //             //     numberController.text.toString()
                              //             )));

                            },
                            color: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: prov.isLoading?const CircularProgressIndicator(color: Colors.white): const Text(
                              "Continue",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // padding: EdgeInsets.only(top: 50),
                          height: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/loginIn.png"),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        );
      }
    ),
),
    );
  }
}
