import 'dart:async' as dart_async;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/services.dart';
import 'package:mainson_de_kolong/Page/HomePage/ChartPage.dart';
import 'package:mainson_de_kolong/Page/DetailOrderPage/DetailOrder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

final dio = Dio();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // dart_async.Timer? _timer;

  // Data
  String username = '';
  List voucher = [];
  List list_kategori = [];
  List list_produk = [];
  String point = '';

  // Parameter kategori
  String kategoriAktif = 'coffee'; // default
  List kategoriData = [];
  List kategoriFull = [];
  List produkTerfilter = [];

  getHttp() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      print("❌ Token belum tersedia");
      return;
    }

    try {
      final res = await dio.get(
        'http://127.0.0.1:8000/api/v1/homepage',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final user = res.data['data']['user'];

      username = user['name'] ?? '';
      point = res.data['data']['loyalty_point']['jumlah_poin'] ?? '0';

      // INI WAJIB LIST
      kategoriData = (res.data['data']['kategori'] as List?) ?? [];
      kategoriFull = res.data['data']['kategori'] ?? [];
      voucher = (res.data['data']['banner_promosi'] as List?) ?? [];
      list_kategori = (res.data['data']['list_kategori'] as List?) ?? [];

      final kategori = res.data['data']['kategori'] as List?;
      list_produk = kategori != null && kategori.isNotEmpty
          ? kategori[0]['produk'] as List
          : [];

      filterProduk();
      setState(() {});
    } catch (e) {
      print("Get HTTP Error: $e");
    }
  }

  String capitalizeWords(String text) {
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  void filterProduk() {
    final selected = kategoriFull.firstWhere(
      (k) => k['nama_kategori'] == kategoriAktif,
      orElse: () => null,
    );

    produkTerfilter = selected?['produk'] ?? [];
  }

  @override
  void initState() {
    getHttp();
    super.initState();
    // _startAutoCheck();
  }

  // void _startAutoCheck() {
  //   // periodic check
  //   _timer = dart_async.Timer.periodic(const Duration(minutes: 1), (t) {
  //     _checkStoreStatus();
  //   });

  //   // Jalankan sekali setelah frame pertama selesai
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _checkStoreStatus();
  //   });
  // }

  // void _checkStoreStatus() {
  //   final hour = DateTime.now().hour;
  //   final storeClosed = (hour >= 24 || hour < 8);

  //   if (storeClosed) {
  //     _showStoreClosedModal();
  //   }
  // }

  // bool _isModalShown = false;

  // void _showStoreClosedModal() {
  //   if (_isModalShown) return;
  //   _isModalShown = true;

  //   showModalBottomSheet(
  //     context: context,
  //     isDismissible: false,
  //     enableDrag: false,
  //     builder: (context) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(5),
  //             topRight: Radius.circular(5),
  //           ),
  //         ),
  //         padding: const EdgeInsets.all(20),
  //         width: double.infinity,
  //         height: 330,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(child: Icon(Remix.store_2_line, size: 63)),
  //             SizedBox(height: 10),
  //             Container(
  //               width: 260,
  //               child: Text(
  //                 'Maaf, Store Sudah diluar Jam Operasional',
  //                 style: GoogleFonts.montserrat(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             Container(
  //               width: 260,
  //               child: Text(
  //                 'Pesanan Aplikasi ditutup 30 Menit sebelum Jam Tutup Store',
  //                 style: GoogleFonts.montserrat(fontSize: 14),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //             SizedBox(height: 30),
  //             GestureDetector(
  //               onTap: () {
  //                 SystemNavigator.pop();
  //               },
  //               child: Container(
  //                 width: 228,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   border: Border.all(width: 2, color: Color(0xffFF0087)),
  //                   borderRadius: BorderRadius.circular(5),
  //                 ),
  //                 padding: EdgeInsets.symmetric(vertical: 10),
  //                 child: Text(
  //                   'Keluar Dari Aplikasi',
  //                   textAlign: TextAlign.center,
  //                   style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    // _timer?.cancel();
    super.dispose();
  }

  // Helper method untuk membuat product item dengan navigasi
  Widget _buildProductItem(Map produk) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailOrder()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset('assets/image/cup.png', fit: BoxFit.contain),
            ),
            SizedBox(height: 5),
            Text(
              capitalizeWords(produk['nama']), // nama dari API
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              produk['harga'], // harga dari API
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(159, 221, 14, 1),
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(
                  context,
                ).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Begin::App Bar
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xffFF008C),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Hai, ',
                                    style: GoogleFonts.montserrat(fontSize: 12),
                                  ),
                                  Text(
                                    username,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffFF008C),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Maison De Kolong',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Perumahan Dosen UNHAS, Jl. Perintis Kemerdekaan Km 8, Tamalanrea Jaya',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      'Melayani',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          RemixIcons.circle_line,
                                          size: 10,
                                          color: Color(0xff4359FF),
                                        ),
                                        Text(
                                          'Pick Up',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          RemixIcons.circle_line,
                                          size: 10,
                                          color: Color(0xff7FFF43),
                                        ),
                                        Text(
                                          'Takeaway',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
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

                      // End::App Bar
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: voucher.length,
                          itemBuilder: (BuildContext content, int index) {
                            // Begin::Voucer
                            return Container(
                              width: 330,
                              margin: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Voucher Card
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        // Bagian atas voucher
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IntrinsicWidth(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Pakai di App',
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            color: Colors.blue,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    SizedBox(
                                                      width: 250,
                                                      child: Text(
                                                        voucher[index]['nama_promo'],
                                                        style:
                                                            GoogleFonts.montserrat(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                      voucher[index]['minimal_pembelian'],
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontSize: 11,
                                                            color:
                                                                Colors.black54,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                padding: const EdgeInsets.all(
                                                  8,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xffF8F8F8,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: const Icon(
                                                  Icons.percent,
                                                  color: Color(0xffFF008C),
                                                  size: 28,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Garis pemisah tengah
                                        Divider(
                                          color: Colors.grey.withOpacity(0.4),
                                          height: 1,
                                          thickness: 2,
                                          indent: 15,
                                          endIndent: 15,
                                        ),

                                        // Bagian bawah voucher
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 15,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Valid For ',
                                                        style:
                                                            GoogleFonts.montserrat(
                                                              fontSize: 11,
                                                            ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            voucher[index]['sisa_waktu'],
                                                        style:
                                                            GoogleFonts.montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 11,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color(0xffFF008C),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 18,
                                                          vertical: 8,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Pakai Voucher',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                            );
                            // End::Voucer
                          },
                        ),
                      ),

                      // Begin::Kolong Poin
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 25,
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/image/cup.png',
                                    height: 104,
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    left: 5,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: ShaderMask(
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
                                              point,
                                              style: GoogleFonts.montserrat(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/image/bintang_cup.png',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffF9CB00).withOpacity(0.4),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF9CB00).withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'KOLONG POINT',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          child: Text(
                                            'Dapatkan poin di setiap pembelanjaan Anda. Nikmati keuntungan eksklusif.',
                                            style: GoogleFonts.montserrat(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    child: Icon(
                                      RemixIcons.gift_line,
                                      color: Color(0xffF9CB00),
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // End::Kolong Poin

                      // Begin::Bar Menu
                      Container(
                        height: 40,
                        color: Color(0XFFD9D9D9),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list_kategori.length,
                          itemBuilder: (BuildContext context, int index) {
                            final String kategori =
                                list_kategori[index]['nama_kategori'];
                            final bool isSelected = kategoriAktif == kategori;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  kategoriAktif = kategori;
                                  filterProduk();
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    capitalizeWords(kategori),
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isSelected
                                          ? Color(0xffFF0087)
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // End::Bar Menu

                      // Begin::Menu
                      // menu 1
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                capitalizeWords(kategoriAktif),
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Center(
                                child: SizedBox(
                                  width: 300,
                                  child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 50,
                                          childAspectRatio: 1,
                                        ),
                                    itemCount: produkTerfilter.length,
                                    itemBuilder: (context, index) {
                                      final produk = produkTerfilter[index];
                                      return _buildProductItem(produk);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 20,
                                      bottom: 10,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Color(0xff32D951),
                                            borderRadius: BorderRadius.circular(
                                              1000,
                                            ),
                                          ),
                                          child: Icon(
                                            RemixIcons.whatsapp_line,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        Container(
                                          child: Text(
                                            'Ceritaki ke Admin (Chat Only)',
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: 30,
                                      left: 30,
                                    ),
                                    child: Text(
                                      'Untuk pertanyaan, keluhan, atau masukan terkait layanan kami, silakan hubungi pusat layanan pengaduan, Butuh bantuan? Tenang ji, tim ta siap layani ta kapan saja !',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 5),
                              width: double.infinity,
                              color: Color(0xff000000).withOpacity(0.4),
                              height: 1,
                              child: Text(''),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.white,
                                  splashFactory: NoSplash.splashFactory,
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: double.infinity,
                                        height: 330,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 2,
                                              color: Color(0x66000000),
                                              child: Text(''),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              'Sertifikasi Halal',
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color(0x80FF0087),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Text(
                                                'Maison De Kolong sudah tersertifikasi halal oleh MUI',
                                                style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 20,
                                                horizontal: 10,
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 14,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0x1AFF008C),
                                                border: Border.all(
                                                  color: Color(0xffFF008C),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: const Image(
                                                      width: 60,
                                                      image: AssetImage(
                                                        'assets/image/logo_halal.png',
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Majelis Ulama Indonesiadata',
                                                          style:
                                                              GoogleFonts.montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          '73410027828900925',
                                                          style:
                                                              GoogleFonts.montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 20,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Bebas dari bahan-bahan yang dilarang \nsyariat islam',
                                                          style:
                                                              GoogleFonts.montserrat(
                                                                fontSize: 14,
                                                                color: Color(
                                                                  0x99000000,
                                                                ),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Diproses dan disajikan sesuai dengan\nstandar islami',
                                                          style:
                                                              GoogleFonts.montserrat(
                                                                fontSize: 14,
                                                                color: Color(
                                                                  0x99000000,
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
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image(
                                                width: 60,
                                                image: AssetImage(
                                                  'assets/image/logo_halal.png',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                'Maison De Kolong sudah tersertifikasi halal oleh MUI',
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(
                                                    0xff000000,
                                                  ).withOpacity(0.6),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        child: Icon(
                                          RemixIcons.arrow_right_s_line,
                                          size: 18,
                                          color: Color(0xffFF0087),
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

                      // End::Menu
                      SizedBox(height: 60),
                    ],
                  ),
                ),
              ),

              // Kotak Ungu Fixed di Bawah - DENGAN FUNGSI KLIK
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChartPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xff4359FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1 Produk',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Rp. 20.000',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            RemixIcons.arrow_right_circle_fill,
                            color: Colors.white,
                            size: 23,
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
      ),
    );
  }
}
