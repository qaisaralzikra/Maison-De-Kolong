import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:mainson_de_kolong/Page/HomePage/SelectedPaymentPage.dart';
import 'package:mainson_de_kolong/Page/HomePage/QrisPayment.dart';

class PaymentCheckout extends StatefulWidget {
  const PaymentCheckout({super.key});

  @override
  State<PaymentCheckout> createState() => _PaymentCheckoutState();
}

class _PaymentCheckoutState extends State<PaymentCheckout> {
  String selectedPayment = ''; // OVO, GoPay, atau QRIS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
          onPressed: () {
            // Show confirmation dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.help_outline,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Keluar Halaman Ini?',
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tinggal selangkah lagi untuk menyelesaikan pembayaran, ada masalah?',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25),
                        // Ya, Sudah Benar button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color(0xffFF008C),
                                  width: 2,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              Navigator.pop(context); // Go back
                            },
                            child: Text(
                              'Ya, Sudah Benar',
                              style: GoogleFonts.montserrat(
                                color: Color(0xffFF008C),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Lanjutkan Bayar button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff991B1B),
                              padding: EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Close dialog only
                            },
                            child: Text(
                              'Lanjutkan Bayar',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.montserrat(
            fontSize: 20,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Store Info
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
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
                              'Store',
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
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
                  ),

                  // Pickup di Store
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffF9FAFB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Remix.store_2_fill,
                          color: Color(0xffFF008C),
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Pickup di Store',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Pembayaran Langsung
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pembayaran Langsung',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedPaymentPage(
                                  selectedPayment: selectedPayment,
                                ),
                              ),
                            );
                            
                            // Update selected payment jika ada hasil
                            if (result != null && result is String) {
                              setState(() {
                                selectedPayment = result;
                              });
                            }
                          },
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Color(0xff6366F1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  // Payment Methods
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        // OVO
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPayment = 'OVO';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: selectedPayment == 'OVO'
                                      ? Color(0xff6366F1)
                                      : Colors.grey.shade300,
                                  width: selectedPayment == 'OVO' ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xff4F1AB5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'O',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'OVO',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // GoPay
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPayment = 'GoPay';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: selectedPayment == 'GoPay'
                                      ? Color(0xff6366F1)
                                      : Colors.grey.shade300,
                                  width: selectedPayment == 'GoPay' ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color(0xff00AED6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Remix.wallet_3_fill,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'GoPay',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        // QRIS
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPayment = 'QRIS';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: selectedPayment == 'QRIS'
                                      ? Color(0xff6366F1)
                                      : Colors.grey.shade300,
                                  width: selectedPayment == 'QRIS' ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'QR',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'QRIS',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
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

                  SizedBox(height: 20),

                  // Pesan
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
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
                              Remix.shopping_cart_2_line,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 x',
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
                                    'Kopi Kolong Ice Fresh Milk Less Sugar',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Normal Ice',
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
                              'Rp. 20.000',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        // Item 2
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 x',
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
                                    'Kopi Petrus Ice Normal Sugar',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Normal Ice',
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
                              'Rp. 25.000',
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  // Pakai Kode Voucher
                  GestureDetector(
                    onTap: () {
                      // Navigate to voucher page
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color(0xffA5B4FC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/image/icon_voucher.png',
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Pakai Kode Voucher',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Subtotal
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Rp. 45.000',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  // Total Pembayaran
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp. 45.000',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Divider(thickness: 1, color: Color(0xffFF008C)),

                  SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Bottom Button - BAGIAN YANG DIUBAH
          Container(
            padding: EdgeInsets.all(15),
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
            child: SizedBox(
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
                  // 👇 CEK APAKAH SUDAH PILIH PAYMENT
                  if (selectedPayment.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Silakan pilih metode pembayaran terlebih dahulu',
                          style: GoogleFonts.montserrat(),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (selectedPayment == 'QRIS') {
                    // 👇 JIKA QRIS, NAVIGASI KE QRISPAYMENT
                    print('Navigating to QrisPayment...');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrisPayment(),
                      ),
                    );
                  } else {
                    // 👇 UNTUK PAYMENT LAIN, TAMPILKAN SNACKBAR
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Pembayaran dengan $selectedPayment belum tersedia',
                          style: GoogleFonts.montserrat(),
                        ),
                        backgroundColor: Color(0xffFF008C),
                      ),
                    );
                  }
                },
                child: Text(
                  'Bayar - Rp. 45.000',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}