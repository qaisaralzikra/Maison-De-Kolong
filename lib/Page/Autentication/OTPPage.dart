import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTPPage(),
    );
  }
}

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Remix.phone_lock_line, size: 80, color: Color(0x99FF008C)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: 167,
                height: 3,
                color: Color(0x99FF008C),
                child: Text(''),
              ),
              const SizedBox(height: 20),
              const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Hello, Rajamoehadi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Container(
                width: 272,
                child: const Text(
                  "Thank you for registering with you, Please Type the OTP as shared on Your Mobile\nxxxxxxxxxx2531",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 30),
              
              // 🔢 Input OTP
              PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  inactiveColor: Color(0xff001EFF),
                  activeColor: Colors.pink,
                  // selectedColor: Colors.pinkAccent,
                ),
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),
              Text(
                "05:00",
                style: TextStyle(color: Colors.redAccent, fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
              
              // 🔘 Tombol Verify
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xccFF0087),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // TODO: tambahkan logic verifikasi OTP di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP entered: ${otpController.text}")),
                  );
                },
                child: const Text(
                  "Verify OTP",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("OTP Not Received?", style: TextStyle(fontSize: 18),),
                  TextButton(
                    onPressed: () {
                      // TODO: resend OTP function
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
