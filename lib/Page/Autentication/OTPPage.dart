import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mainson_de_kolong/Page/Autentication/Registrasi.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:remixicon/remixicon.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController otpController = TextEditingController();
  late Timer _timer;
  int _secondsRemaining = 12; // 5 menit = 300 detik

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      setState(() {
        // 🧠 Pastikan tidak jadi NaN
        if (_secondsRemaining.isNaN) {
          _secondsRemaining = 0;
        }

        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();

          // 🔁 Redirect ke halaman Registrasi
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Registrasi()),
          );
        }
      });
    });
  }

  // ⏱ Format waktu dengan aman
  String _formatTime(int seconds) {
    if (seconds.isNaN || seconds.isInfinite) seconds = 0;
    if (seconds < 0) seconds = 0;

    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

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
              const Icon(Remix.phone_lock_line,
                  size: 80, color: Color(0x99FF008C)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 167,
                height: 3,
                color: const Color(0x99FF008C),
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
              const SizedBox(
                width: 272,
                child: Text(
                  "Thank you for registering, please type the OTP shared to your mobile.",
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
                textStyle: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  inactiveColor: const Color(0xff001EFF),
                  activeColor: Colors.pink,
                ),
                onChanged: (value) {},
              ),

              const SizedBox(height: 20),

              // 🕐 Timer countdown
              Text(
                _formatTime(_secondsRemaining),
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xccFF0087),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
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
                  const Text("OTP Not Received?", style: TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Resend OTP pressed")),
                      );
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
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
