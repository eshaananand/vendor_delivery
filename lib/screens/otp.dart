import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_providers/verify_otp_provider.dart';
import 'auth.dart';

class Otp extends StatefulWidget {
  final String number;
  const Otp({Key? key,required this.number}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<VerifyOtpProvider>(
  create: (context) => VerifyOtpProvider()..startTimer(),
    child: Consumer<VerifyOtpProvider>(
      builder: (_,prov,__) {
        return AbsorbPointer(
          absorbing: prov.isLoading,
          child: WillPopScope(
            onWillPop: ()async{
              prov.timer!.cancel();
              return true;
            },
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white,
                bottomNavigationBar: Material(
                  color: Colors.red,
                  child: InkWell(
                    onTap: () {
                      prov.verifyOtp(number: widget.number, otp: otpController.text, isReset: false, context: context);
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => const Auth()));
                    },
                    child:  SizedBox(
                      height: kToolbarHeight,
                      width: double.infinity,
                      child: Center(
                        child:prov.isLoading? const CircularProgressIndicator(color: Colors.white):const Text(
                          'Continue',
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
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceBe,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[4],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                "Verify your contact number",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Enter the verification Code , We've sent on the given number",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 60, 20),
                          child: TextFormField(
                            controller: otpController,
                            validator: (value) =>
                            value!.isEmpty ? 'Enter the OTP' : null,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Enter the OTP",
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
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Resend",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 0, left: 20),
                          child: Text(
                            "Valid till ${prov.time} sec",
                            style: const TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ]),
                ),
              ),
          ),
        );
      }
    ),
),
    );
  }
}
