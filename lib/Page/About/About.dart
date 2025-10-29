import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
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
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CERITA KOLONG',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      child: Align(
                        alignment: AlignmentGeometry.center,
                        child: Image.asset('assets/image/logo_kolong_1.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.black,
                          height: 1.5,
                        ),
                        children: const [
                          TextSpan(
                            text:
                                'Maison de Kolong lahir dari semangat mahasiswa ',
                          ),
                          TextSpan(
                            text: 'Universitas Hasanuddin',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' yang ingin memperkenalkan cita rasa kopi lokal Makassar ke dunia.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Kami percaya setiap Cup kopi menyimpan cerita tentang tanah Sulawesi yang kaya, para petani yang berdedikasi, dan budaya yang menginspirasi. Dari kampus hingga ke kedai pertama kami di Makassar, perjalanan ini kami mulai dengan tekad untuk menghadirkan kopi berkualitas dengan harga yang bersahabat.',
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      'Dengan menggabungkan teknologi dan pelayanan hangat khas Sulawesi Selatan, Maison de Kolong ingin memberikan pengalaman ngopi yang mudah, cepat, dan menyenangkan di mana pun dan kapan pun. Maison de Kolong dari kampus, untuk kota, dari Makassar untuk dunia.',
                    ),
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
