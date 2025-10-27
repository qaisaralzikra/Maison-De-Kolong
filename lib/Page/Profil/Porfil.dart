import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/HomePage/HomePage.dart';
import 'package:mainson_de_kolong/main.dart';
import 'package:remixicon/remixicon.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Profil(),
//     ),
//   );
// }

class Profil extends StatelessWidget {
  const Profil({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 70,
                        left: 16,
                        right: 16,
                        bottom: 40,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66000000),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hai,', style: TextStyle(fontSize: 14)),
                                Text(
                                  'Rajamoehadi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 25),
                          SizedBox(
                            height: 50,
                            width: 2,
                            child: Container(
                              color: Color(0xffFF008C),
                              child: Text(''),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                  height: 48,
                                  child: Container(
                                    child: Image.asset('assets/image/cup.png'),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'KOLONG POINT',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            ShaderMask(
                                              shaderCallback: (bounds) =>
                                                  const LinearGradient(
                                                    colors: [
                                                      Colors.pinkAccent,
                                                      Colors.black,
                                                    ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                  ).createShader(
                                                    Rect.fromLTWH(
                                                      0,
                                                      0,
                                                      bounds.width,
                                                      bounds.height,
                                                    ),
                                                  ),
                                              child: const Text(
                                                '0',
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors
                                                      .white, // wajib ada tapi tidak berpengaruh
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                'PTS',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0x80000000),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x66000000),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // tanpa bayangan
                              backgroundColor:
                                  Colors.transparent, // tanpa warna background
                              shadowColor: Colors
                                  .transparent, // pastikan tidak ada efek shadow
                              splashFactory: NoSplash
                                  .splashFactory, // hilangkan efek klik ripple
                              padding: EdgeInsets.zero, // rapikan padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Remix.inbox_2_fill,
                                        color: Color(0xcc001EFF),
                                        size: 23,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Kotak Masuk',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Remix.arrow_right_s_line,
                                    size: 30,
                                    color: Color(0xffFF0087),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // tanpa bayangan
                              backgroundColor:
                                  Colors.transparent, // tanpa warna background
                              shadowColor: Colors
                                  .transparent, // pastikan tidak ada efek shadow
                              splashFactory: NoSplash
                                  .splashFactory, // hilangkan efek klik ripple
                              padding: EdgeInsets.zero, // rapikan padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Remix.fingerprint_line,
                                        color: Color(0xcc001EFF),
                                        size: 23,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Aktifkan Biometric ID',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Remix.arrow_right_s_line,
                                    size: 30,
                                    color: Color(0xffFF0087),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // tanpa bayangan
                              backgroundColor:
                                  Colors.transparent, // tanpa warna background
                              shadowColor: Colors
                                  .transparent, // pastikan tidak ada efek shadow
                              splashFactory: NoSplash
                                  .splashFactory, // hilangkan efek klik ripple
                              padding: EdgeInsets.zero, // rapikan padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Remix.global_line,
                                        color: Color(0xcc001EFF),
                                        size: 23,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Ubah Bahasa',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Remix.arrow_right_s_line,
                                    size: 30,
                                    color: Color(0xffFF0087),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // tanpa bayangan
                              backgroundColor:
                                  Colors.transparent, // tanpa warna background
                              shadowColor: Colors
                                  .transparent, // pastikan tidak ada efek shadow
                              splashFactory: NoSplash
                                  .splashFactory, // hilangkan efek klik ripple
                              padding: EdgeInsets.zero, // rapikan padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Remix.history_line,
                                        color: Color(0xcc001EFF),
                                        size: 23,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Riwayat Pesanan',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Remix.arrow_right_s_line,
                                    size: 30,
                                    color: Color(0xffFF0087),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0, // tanpa bayangan
                              backgroundColor:
                                  Colors.transparent, // tanpa warna background
                              shadowColor: Colors
                                  .transparent, // pastikan tidak ada efek shadow
                              splashFactory: NoSplash
                                  .splashFactory, // hilangkan efek klik ripple
                              padding: EdgeInsets.zero, // rapikan padding
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Remix.wallet_line,
                                        color: Color(0xcc001EFF),
                                        size: 23,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Metode Pembayaran',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Remix.arrow_right_s_line,
                                    size: 30,
                                    color: Color(0xffFF0087),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 35),
                            child: Text(
                              'Maison De Kolong',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 35,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x66000000),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0, // tanpa bayangan
                                    backgroundColor: Colors
                                        .transparent, // tanpa warna background
                                    shadowColor: Colors
                                        .transparent, // pastikan tidak ada efek shadow
                                    splashFactory: NoSplash
                                        .splashFactory, // hilangkan efek klik ripple
                                    padding: EdgeInsets.zero, // rapikan padding
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Remix.whatsapp_line,
                                              color: Color(0xff910002),
                                              size: 23,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Layanan Whatsapp',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0, // tanpa bayangan
                                    backgroundColor: Colors
                                        .transparent, // tanpa warna background
                                    shadowColor: Colors
                                        .transparent, // pastikan tidak ada efek shadow
                                    splashFactory: NoSplash
                                        .splashFactory, // hilangkan efek klik ripple
                                    padding: EdgeInsets.zero, // rapikan padding
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Remix.mail_line,
                                              color: Color(0xff910002),
                                              size: 23,
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Lapor Masalah',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0, // tanpa bayangan
                                    backgroundColor: Colors
                                        .transparent, // tanpa warna background
                                    shadowColor: Colors
                                        .transparent, // pastikan tidak ada efek shadow
                                    splashFactory: NoSplash
                                        .splashFactory, // hilangkan efek klik ripple
                                    padding: EdgeInsets.zero, // rapikan padding
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 23,
                                              height: 20,
                                              child: Image.asset(
                                                'assets/image/logo_kolong.png',
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              'Tentang Kolong',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
