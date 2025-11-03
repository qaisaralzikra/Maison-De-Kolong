import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/main.dart';
import 'package:remixicon/remixicon.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int selectedIndex = 0;

  Widget _buildTab(String title, String subtitle, int index) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 80, // 🔥 Tambah tinggi biar tab selalu kelihatan
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
              color: isActive ? Colors.pink : Colors.transparent,
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
                color: isActive ? Colors.pink : Colors.black87,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: isActive ? const Color(0xff001EFF) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 6,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Berhasil",
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "Maison De Kolong PERDOS UNHAS",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          const Text(
            "Senin, 12 Juli 2025 12:12",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            "1 Kopi Kolong Ice",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          Text(
            "1 Kopi Petrus Ice",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "2 Item | Rp. 45.000",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Pesan Lagi",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabContent() {
    if (selectedIndex == 0) {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Remix.shopping_bag_3_line, color: Color(0x33000000), size: 75,),
              SizedBox(height: 6,),
              Text('Belum Ada Pesanan', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Color(0x33000000), fontSize: 18),),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainStack()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 2, color: Color(0xffFF0087)),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Pesan Sekarang', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),)),
              ),
            ],
          ),
        ),
      );
    } else {
      return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => _orderCard(),
        ),
      );
    }
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
            borderRadius: const BorderRadius.only(
              // bottomLeft: Radius.circular(14),
              // bottomRight: Radius.circular(14),
            ),
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
                    'Hisory Order',
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
        body: Column(
          children: [
            // 🔥 Tab bar fix
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
                      // Tab kiri
                      Positioned(
                        left: 0,
                        width: tabWidth,
                        height: 70,
                        child: _buildTab(
                          "Sedang Jalan",
                          "sementara diproses",
                          0,
                        ),
                      ),
                      // Tab kanan
                      Positioned(
                        right: 0,
                        width: tabWidth,
                        height: 70,
                        child: _buildTab("Completed", "Terima Kasih", 1),
                      ),
                      // Tab aktif di atas (z-index paling tinggi)
                      Positioned(
                        left: selectedIndex == 0 ? 0 : null,
                        right: selectedIndex == 1 ? 0 : null,
                        width: tabWidth,
                        height: 70,
                        child: IgnorePointer(
                          child: _buildTab(
                            selectedIndex == 0 ? "Sedang Jalan" : "Completed",
                            selectedIndex == 0
                                ? "sementara diproses"
                                : "Terima Kasih",
                            selectedIndex,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // 🔽 Isi konten
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: _tabContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
