import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/About/About.dart';
import 'package:mainson_de_kolong/Page/HistoryPage/History.dart';
import 'package:mainson_de_kolong/Page/HomePage/HomePage.dart';
import 'package:mainson_de_kolong/Page/LanguageSetting/LanguageSetting.dart';
import 'package:mainson_de_kolong/Page/Message/KotakMasuk.dart';
import 'package:mainson_de_kolong/Page/MetodePembayaran/MetodePembayaran.dart';
import 'package:mainson_de_kolong/Page/Autentication/Login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:remixicon/remixicon.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Future<void> whatsAppOpen() async {
    const phoneNumber = '6285399205213';
    const message =
        'Halo, saya ingin bertanya mengenai layanan Maison De Kolong.';
    final Uri url = Uri.parse(
      'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Gagal membuka WhatsApp');
    }
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
      Future<void> _showLogoutDialog() async {
        return showDialog<void>(
          context: context,
          barrierDismissible: false, 
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                'Konfirmasi Logout',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              content: Text(
                'Apakah Anda yakin ingin keluar dari akun?',
                style: GoogleFonts.montserrat(fontSize: 14),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    'Tidak',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFF0087),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Ya, Logout',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            );
          },
        );
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
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
                                      child: Image.asset('assets/image/cup_poin.png'),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                  bottom: 5,
                                                ),
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
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Message(),
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
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Home()),
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
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LanguageSettingPage(),
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
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => History()),
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
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Metodepembayaran(),
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
                            SizedBox(height: 10),
                            // 👇 TOMBOL LOGOUT BARU
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: _showLogoutDialog,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Remix.logout_box_line,
                                          color: Color(0xffFF0000),
                                          size: 23,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Logout',
                                          style: TextStyle(
                                            color: Color(0xffFF0000),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
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
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      splashFactory: NoSplash.splashFactory,
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: whatsAppOpen,
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
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      splashFactory: NoSplash.splashFactory,
                                      padding: EdgeInsets.zero,
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
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      splashFactory: NoSplash.splashFactory,
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => About(),
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
      ),
    );
  }
}