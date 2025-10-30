import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SuccesOrder());
}

class SuccesOrder extends StatelessWidget {
  const SuccesOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff1D8B31),
        body: SafeArea(
          child: Stack(
            children: [
              // Logo kiri atas
              Positioned(
                left: 30,
                top: 30,
                child: SizedBox(
                  width: 75,
                  height: 45,
                  child: Image.asset(
                    'assets/image/logo_kolong_voucher.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Gambar centang besar
              Positioned(
                top: MediaQuery.of(context).size.height * 0.20,
                
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Image.asset(
                      'assets/image/centang.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Text di bawah centang
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.20,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          'SUCCES!',
                          style: GoogleFonts.montserrat(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Yeay! Pembayaran berhasil 🎉 Duduk santai dulu, baristamu lagi ngeracik pesanan terbaikmu.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
