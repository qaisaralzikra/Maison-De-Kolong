import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mainson_de_kolong/Page/DetailOrderPage/DetailOrder.dart';
import 'package:mainson_de_kolong/Page/HomePage/HomePage.dart';
import 'package:mainson_de_kolong/Page/PromoPage/PromoPage.dart';
import 'package:mainson_de_kolong/Page/Autentication/Login.dart';
import 'package:mainson_de_kolong/Page/Profil/Porfil.dart';
import 'package:mainson_de_kolong/Page/Reedem%20Voucher/ReedemVoucher.dart';
import 'package:mainson_de_kolong/Page/SplashScreen/SplashScreen.dart';

void main() {
  runApp(const Azka());
}

class Azka extends StatelessWidget {
  const Azka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(159, 221, 14, 1),
        ),
      ),
      // 👉 atur route di sini saja
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => const Login(),
        '/home': (context) => const MainStack(),
      },
    );
  }
}

class MainStack extends StatefulWidget {
  const MainStack({super.key});

  @override
  State<MainStack> createState() => _MainStackState();
}

class _MainStackState extends State<MainStack> {
  int _page = 0;

  final List<Widget> _pages = const [
    Home(),
    PromoPage(),
    Reedemvoucher(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xffFF008C);
    const Color inactiveColor = Colors.white;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _page, children: _pages),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,

        ),
        child: CurvedNavigationBar(
          index: _page,
          height: 60,
          backgroundColor: Colors.transparent,
          color: mainColor,
          buttonBackgroundColor: Colors.white,
          animationDuration: const Duration(milliseconds: 400),

          items: [
            Icon(Icons.home,
                size: 28, color: _page == 0 ? mainColor : inactiveColor),
            Icon(Icons.list,
                size: 28, color: _page == 1 ? mainColor : inactiveColor),
            Icon(Icons.settings,
                size: 28, color: _page == 2 ? mainColor : inactiveColor),
            Icon(Icons.person,
                size: 28, color: _page == 3 ? mainColor : inactiveColor),
          ],

          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}

