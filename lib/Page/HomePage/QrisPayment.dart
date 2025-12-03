import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:mainson_de_kolong/Page/HomePage/CanceledPage.dart';

class QrisPayment extends StatelessWidget {
  const QrisPayment({super.key});

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
              Icons.close,
              color: Colors.black,
              size: 24,
            ),
          ),
          onPressed: () {
            _showCancelDialog(context);
          },
        ),
        title: Text(
          'Pembayaran QRIS',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // QR Code Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: Column(
                  children: [
                    // QR Code Placeholder
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.qr_code_2,
                          size: 200,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Unduh atau Screenshot
                    Text(
                      'Unduh atau Screenshot gambar QRIS',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 15),
                    // Simpan Gambar QRIS Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff991B1B),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Handle save QR code
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Gambar QRIS berhasil disimpan',
                              style: GoogleFonts.montserrat(),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Text(
                        'Simpan Gambar QRIS',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // Cara bayar dengan QRIS
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cara bayar dengan QRIS',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Instructions Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    // Langkah 1
                    _buildInstructionStep(
                      number: '1',
                      title: 'Langkah 1',
                      description: 'Simpan Gambar QRIS',
                      icon: Remix.qr_scan_2_line,
                      iconColor: Color(0xffFF008C),
                    ),
                    SizedBox(height: 20),
                    // Langkah 2
                    _buildInstructionStep(
                      number: '2',
                      title: 'Langkah 2',
                      description:
                          'Buka aplikasi Bank / E-wallet Kamu,\nKemudian Pilih Pembayaran Qris',
                      icon: Remix.smartphone_line,
                      iconColor: Color(0xffFF008C),
                    ),
                    SizedBox(height: 20),
                    // Langkah 3
                    _buildInstructionStep(
                      number: '3',
                      title: 'Langkah 3',
                      description:
                          'Lakukan Pembayaran dengan\nUpload gambar QRIS Melalui Galery',
                      icon: Remix.image_line,
                      iconColor: Color(0xffFF008C),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Batalkan Button
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
                  onPressed: () {
                    _showCancelDialog(context);
                  },
                  child: Text(
                    'Batalkan',
                    style: GoogleFonts.montserrat(
                      color: Color(0xffFF008C),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

// Method _showCancelDialog yang diupdate
void _showCancelDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext dialogContext) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Pertanyaan
              Text(
                'Apakah Kamu Yakin Ingin membatalkan Pembayaran?',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              // Buttons
              Row(
                children: [
                  // Ya, Batalkan Button
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext); // Close dialog
                        // 👇 NAVIGASI KE CANCELEDPAGE
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CanceledPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Ya, Batalkan',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Lanjutkan Button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff991B1B),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(dialogContext); // Just close dialog
                      },
                      child: Text(
                        'Lanjutkan',
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
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildInstructionStep({
    required String number,
    required String title,
    required String description,
    required IconData icon,
    required Color iconColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 28,
          ),
        ),
        SizedBox(width: 15),
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6366F1),
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}