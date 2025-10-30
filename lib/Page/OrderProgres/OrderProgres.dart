import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderProgressPage(),
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
    ),
  );
}

class OrderProgressPage extends StatelessWidget {
  const OrderProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              SizedBox(
                width: 70,
                child: Image.asset('assets/image/logo_kolong.png'),
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  'Your Order Is Confirmed!',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 290,
                child: Text(
                  'Pesanan kamu sedang diproses. Mohon tunggu sebentar, ya!',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: 280,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Color(0xffFF0087), blurRadius: 5),
                  ],
                ),
                child: Text(
                  'Status Order',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 217, 217, 217),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  width: 280,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- LEFT: content boxes ---
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCard(
                              icon: Remix.wallet_3_line,
                              title: "Payment",
                              subtitle: "Succes",
                              activeColor: Colors.greenAccent,
                              isActive: true,
                            ),
                            const SizedBox(height: 12),
                            _buildCard(
                              icon: Remix.cup_line,
                              title: "Order",
                              subtitle: "Procces",
                              activeColor: Colors.grey.shade300,
                              isActive: false,
                            ),
                            const SizedBox(height: 12),
                            _buildCard(
                              icon: Remix.heart_line,
                              title: "Ready",
                              subtitle: "On The Bar",
                              activeColor: Colors.grey.shade300,
                              isActive: false,
                            ),
                          ],
                        ),
                      ),

                      // --- RIGHT: progress bar ---
                      const SizedBox(width: 16),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildStatusCircle(true),
                            _buildLine(true),
                            _buildStatusCircle(true),
                            _buildLine(false),
                            _buildStatusCircle(false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 280,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Terima kasih atas kesabarannya ',
                      ),
                      TextSpan(
                        text: 'Fait De Amore',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' Jangan Lupa Cek Kembali Pesanan Kamu!',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Content box (Payment, Order, Ready)
  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color activeColor,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive
            ? Colors.greenAccent.withOpacity(0.4)
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87, size: 20),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Circle status
  Widget _buildStatusCircle(bool isActive) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: isActive ? Colors.greenAccent : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.check,
        color: isActive ? Colors.black : Colors.grey.shade500,
        size: 20,
      ),
    );
  }

  // 🔹 Connector line
  Widget _buildLine(bool isActive) {
    return Container(
      width: 4,
      height: 40,
      color: isActive ? Colors.greenAccent : Colors.grey.shade300,
    );
  }
}
