import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Reset(),
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
    ),
  );
}

class Reset extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 Custom AppBar dengan border radius bawah
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffFF0087),
            title: Row(
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0, // tanpa bayangan
                      backgroundColor:
                          Colors.transparent, // tanpa warna background
                      shadowColor:
                          Colors.white, // pastikan tidak ada efek shadow
                      splashFactory:
                          NoSplash.splashFactory, // hilangkan efek klik ripple
                      padding: EdgeInsets.zero, // rapikan padding
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Remix.arrow_left_fill,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                const Text(
                  'Reset Kata Sandi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // 🔹 Body
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60, left: 30, right: 30),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ganti Kata Sandi, Yuk!',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1),
                        Container(
                          width: 252,
                          child: Text(
                            'Biar akun Kamu tetap aman, buat kata sandi baru yang mudah diingat, tapi sulit ditebak!',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kata Sandi Baru',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 270,
                                height: 40,
                                margin: EdgeInsets.only(top: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Color(0xff000000).withOpacity(0.4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    prefixIcon: Icon(
                                      RemixIcons.lock_unlock_line,
                                      color: Color(0xff000000).withOpacity(0.4),
                                    ),
                                    border: InputBorder.none,
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                      minHeight: 40,
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 16,
                                      right: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 270,
                                height: 40,
                                margin: EdgeInsets.only(top: 25),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Konfirmasi Password',
                                    hintStyle: TextStyle(
                                      color: Color(0xff000000).withOpacity(0.4),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    prefixIcon: Icon(
                                      RemixIcons.lock_unlock_line,
                                      color: Color(0xff000000).withOpacity(0.4),
                                    ),
                                    border: InputBorder.none,
                                    prefixIconConstraints: BoxConstraints(
                                      minWidth: 40,
                                      minHeight: 40,
                                    ),
                                    contentPadding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 16,
                                      right: 16,
                                    ),
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
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFF0087)
              ),
              width: double.infinity,
              child: Container(child: Text('Reset Kata Sandi')),
            ),
          ),
        ],
      ),
    );
  }
}