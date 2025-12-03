import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:mainson_de_kolong/main.dart';
import 'package:mainson_de_kolong/Page/PromoPage/DetailPromo.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});
  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
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
              title: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'KOLONG REDEEM',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 70,
                    left: 16,
                    right: 16,
                    bottom: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x66000000),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hai,',
                            style: GoogleFonts.montserrat(fontSize: 10),
                          ),
                          Text(
                            'Rajamoehadi',
                            style: GoogleFonts.montserrat(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 25),
                      SizedBox(
                        height: 50,
                        width: 2,
                        child: Container(
                          color: const Color(0xffFF008C),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 61,
                            child: Image.asset('assets/image/cup_poin.png'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'KOLONG POINT',
                                style: GoogleFonts.montserrat(
                                  fontSize: 6,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
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
                                    child: Text(
                                      '320',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'PTS',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 6,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0x80000000),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'KOLONG',
                              style: GoogleFonts.montserrat(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: const Color(0x66000000),
                              ),
                            ),
                            Text(
                              'REWARD',
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          _buildPromoCard(context),
                          _buildPromoCard(context),
                          _buildPromoCard(context),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x4d4359FF),
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kolong Calling ! Diskon 20%',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Maksimum Rp50k',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 37,
                  height: 26,
                  child: Image.asset(
                    fit: BoxFit.contain,
                    'assets/image/logo_kolong_voucer.png',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Berlaku Hingga',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Remix.time_fill,
                        size: 16,
                        color: Color(0xffFF008C),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '5 Jam',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Min Transaksi',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Rp. 99.000',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),

                  // Garis vertikal dashed
                  const DashedVerticalLine(
                    height: 40,
                    dashWidth: 2,
                    dashSpace: 4,
                    color: Colors.grey,
                  ),

                  const SizedBox(width: 20),

                  // Tukar Button - CLICKABLE
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailPromoPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0x99FF008C),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Tukar',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget untuk garis dashed vertikal
class DashedVerticalLine extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DashedVerticalLine({
    super.key,
    required this.height,
    this.dashWidth = 2,
    this.dashSpace = 10,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashCount = (height / (dashWidth + dashSpace)).floor();
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              height: 6,
              width: 1,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}