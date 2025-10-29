import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          // child: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30),
                  child: Container(
                    width: 300,
                    child: Stack(
                      clipBehavior: Clip
                          .none, // supaya Positioned di luar boundary masih kelihatan
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'G',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top:5),
                              child: Text(
                                'ood vibes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 34,
                          left: 23,
                          child: Container(
                            child: Text(
                              'Start Here!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    offset: Offset(
                                      2,
                                      5,
                                    ), // posisi bayangan (x, y)
                                    blurRadius: 10, // seberapa blur
                                    color: Color(0xFFFF0087), // warna bayangan
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
                Container(
                  margin: EdgeInsets.only(top:40),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Stack(
                      children: [
                        Container(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                width: 150,
                                image: AssetImage('assets/image/logo_kolong.png'),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 177,
                          right: 0,
                          child: Transform.rotate(
                            angle:
                                -0.23, // dalam radian, bukan derajat! (π rad = 180°)
                            child: Container(
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'FAIT DE AMORE',
                                style: GoogleFonts.tiny5(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff001EFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),]
                  ),
                ),
                Positioned(
                  bottom: 0, // kamu bisa ubah ke bottom, right, dll
                  right: 0,
                  child: Image.asset('assets/image/cup_pink.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
