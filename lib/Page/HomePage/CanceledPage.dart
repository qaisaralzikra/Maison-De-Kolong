import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mainson_de_kolong/Page/HomePage/PaymentCheckout.dart';

class CanceledPage extends StatelessWidget {
  const CanceledPage({super.key});

  Future<void> _openWhatsApp() async {
    const phoneNumber = '6285399205213';
    const message = 'Halo, saya ingin bantuan mengenai pesanan yang dibatalkan.';
    final Uri url = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Gagal membuka WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detail Pesanan',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pesanan Dibatalkan Header
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Pesanan Dibatalkan',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff991B1B),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Pesanan kamu telah dibatalkan,',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            'Silahkan order kembali dengan Pembayaran yang lain',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            '12 Jul 2025 | 12.00',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25),

                    // Pick Up Info
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff6366F1),
                              width: 6,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pick Up',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Maison De Kolong',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Pesan Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Color(0xffFFA500),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Pesan',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'Total 2 Item',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 25),
                          // Item 1
                          _buildOrderItem(
                            quantity: '1 x',
                            name: 'Kopi Kolong Ice Fresh Milk Less Sugar',
                            note: 'Normal Ice',
                            price: 'Rp. 20.000',
                          ),
                          SizedBox(height: 15),
                          // Item 2
                          _buildOrderItem(
                            quantity: '1 x',
                            name: 'Kopi Petrus Ice Normal Sugar',
                            note: 'Normal Ice',
                            price: 'Rp. 25.000',
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Detail Pembayaran
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Detail Pembayaran',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    'QR',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'QRIS',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rp. 45.000',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Refund',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFF008C),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Bantuan Via WhatsApp
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(
                        color: Color(0xffFF008C),
                        width: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _openWhatsApp,
                    child: Text(
                      'Bantuan Via WhatsApp',
                      style: GoogleFonts.montserrat(
                        color: Color(0xffFF008C),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Order Lagi
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff991B1B),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Navigate back to home or order page
                      Navigator.pop(context, (route) => PaymentCheckout());
                    },
                    child: Text(
                      'Order Lagi',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String quantity,
    required String name,
    required String note,
    required String price,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quantity,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                note,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Text(
          price,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}