import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/PromoPage/PromoPage.dart';
import 'package:mainson_de_kolong/Page/HomePage/PaymentCheckout.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  int selectedIndex = 0; // 0 = Pickup, 1 = Dine In
  int item1Quantity = 1;
  int item2Quantity = 1;

  Widget _buildTab(String title, String subtitle, int index) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(index == 0 ? 5 : -5, 0),
                  ),
                ]
              : [],
          border: Border(
            top: BorderSide(
              color: isActive ? Color(0xffFF008C) : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                color: isActive ? Color(0xffFF008C) : Colors.black87,
                fontSize: 15,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.montserrat(
                fontSize: 8,
                color: isActive ? const Color(0xff6366F1) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabContent() {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store Location
            Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF008C), width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Store ',
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Maison De Kolong',
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Perumahan Dosen UNHAS, Jl. Perintis Kemerdekaan Km 8, Tamalanrea Jaya',
                      style: GoogleFonts.montserrat(
                        fontSize: 8,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pesan Header
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pesan',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Kembali ke HomePage
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFF008C).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Tambah Pesanan +',
                        style: GoogleFonts.montserrat(
                          color: Color(0xffFF008C),
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Item 1
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kopi Kolong',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Rp. 20.000',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/image/kopi_kolong.png',
                        height: 91,
                        width: 79,
                      ),
                      SizedBox(height: 10),
                      // Quantity Controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (item1Quantity > 1) {
                                setState(() {
                                  item1Quantity--;
                                });
                              }
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffFF008C),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$item1Quantity',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item1Quantity++;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffFF008C),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Item 2
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kopi Kolong',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Rp. 25.000',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/image/kopi_kolong_lagi.png',
                        height: 91,
                        width: 79,
                      ),
                      SizedBox(height: 10),
                      // Quantity Controls
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (item2Quantity > 1) {
                                setState(() {
                                  item2Quantity--;
                                });
                              }
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffFF008C),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$item2Quantity',
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                item2Quantity++;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffFF008C),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 13,
                              ),
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

            // Pakai Kode Voucher
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PromoPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                            width: 21.24,
                            height: 21.24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Pakai Kode Voucher',
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 100), // Extra space untuk bottom button
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0x804359FF),
              title: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Remix.arrow_left_circle_line,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Konfirmasi Pesanan',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                // Tab bar
                Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x804359FF), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final tabWidth = constraints.maxWidth / 2;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Tab kiri (Pickup)
                          Positioned(
                            left: 0,
                            width: tabWidth,
                            height: 70,
                            child: _buildTab(
                              "Pickup",
                              "Order dan Pickup di Store",
                              0,
                            ),
                          ),
                          // Tab kanan (Dine In)
                          Positioned(
                            right: 0,
                            width: tabWidth,
                            height: 70,
                            child: _buildTab(
                              "Dine In",
                              "Order dan Makan di Tempat",
                              1,
                            ),
                          ),
                          // Tab aktif di atas (z-index paling tinggi)
                          Positioned(
                            left: selectedIndex == 0 ? 0 : null,
                            right: selectedIndex == 1 ? 0 : null,
                            width: tabWidth,
                            height: 70,
                            child: IgnorePointer(
                              child: _buildTab(
                                selectedIndex == 0 ? "Pickup" : "Dine In",
                                selectedIndex == 0
                                    ? "Order dan Pickup di Store"
                                    : "Order dan Makan di Tempat",
                                selectedIndex,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Isi konten
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    color: Colors.white,
                    child: _tabContent(),
                  ),
                ),
              ],
            ),

            // Total and Payment Button - Fixed di bawah
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffFF008C),
                      width: 3,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Rp. ${((20000 * item1Quantity) + (25000 * item2Quantity)).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff991B1B),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
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
                                    // Close button
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.3),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Radio button + Title
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
                                        SizedBox(width: 15),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pick Up',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Store Maison De Kolong',
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
                                    // Pickup di Store box
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xffF3F4F6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Remix.store_2_fill,
                                            color: Color(0xffFF008C),
                                            size: 24,
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
                                    SizedBox(height: 15),
                                    // Description
                                    Text(
                                      'Ambil Pesananmu di Area Pickup di dalam Store',
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PaymentCheckout(),
                                            ),
                                          );
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
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Pilih Pembayaran',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}