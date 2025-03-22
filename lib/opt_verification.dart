import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OPTVerificationScreen extends StatefulWidget {
  const OPTVerificationScreen({super.key});

  @override
  OPTVerificationScreenState createState() => OPTVerificationScreenState();
}

class OPTVerificationScreenState extends State<OPTVerificationScreen> {

  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: const Icon(Icons.arrow_back, color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                circularIcon(
                  context,
                  Icons.mail_lock_rounded,
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Enter code that was sent to your email for security.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: " GiveHope ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      TextSpan(
                        text: "account.",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.035,
                ),
                Text(
                  "Enter 6-digit Code",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  enablePinAutofill: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: Colors.blue,
                    activeFillColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    selectedColor: Colors.blue,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: screenHeight * 0.07,
                    fieldWidth: screenWidth * 0.12,
                  ),
                  onChanged: (value) {
                    setState(() {
                    });
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: screenHeight * 0.055,
                ),
                RoundButton(
                  buttonText: "Verify",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  static Widget circularIcon(context,IconData data) {
    return Center(
        child: CircleAvatar(
            backgroundColor: Colors.blue,
            minRadius: MediaQuery.of(context).size.height * 0.1,
            child: Icon(
              data,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.12,
            )));
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 55,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 30),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(6)),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 19),
        ),
      ),
    );
  }
}

class ToastMessage {
  static toastMsg(String msgIs) {
    return Fluttertoast.showToast(
        msg: msgIs,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
