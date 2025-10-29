import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/Autentication/Login.dart';
import 'package:remixicon/remixicon.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Reset(),
//     ),
//   );
// }

class Reset extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  Reset({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Scaffold(
        backgroundColor: Colors.white,

        // 🔹 Custom AppBar
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
                      Remix.arrow_left_fill,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
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

        // 🔹 Body pakai Stack
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  // --- Scrollable konten utama ---
                  SingleChildScrollView(
                    // padding: const EdgeInsets.only(bottom: 100),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            top: 60,
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ganti Kata Sandi, Yuk!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 1),
                              const SizedBox(
                                width: 252,
                                child: Text(
                                  'Biar akun Kamu tetap aman, buat kata sandi baru yang mudah diingat, tapi sulit ditebaks!',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              const SizedBox(height: 25),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Kata Sandi Baru',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Container(
                                      width: 270,
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                          ),
                                          prefixIcon: Icon(
                                            Remix.lock_unlock_line,
                                            color: Colors.black38,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Container(
                                      width: 270,
                                      height: 40,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Konfirmasi Password',
                                          hintStyle: TextStyle(
                                            color: Color(0xff000000),
                                          ),
                                          prefixIcon: Icon(
                                            Remix.lock_unlock_line,
                                            color: Colors.black38,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // --- Tombol di paling bawah ---
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xffFF0087),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0, // tanpa bayangan
                          backgroundColor:
                              Colors.transparent, // tanpa warna background
                          shadowColor:
                              Colors.white, // pastikan tidak ada efek shadow
                          splashFactory: NoSplash
                              .splashFactory, // hilangkan efek klik ripple
                          padding: EdgeInsets.zero, // rapikan padding
                        ),
                        onPressed: () {
                          ResetPasswordSuccessDialog.show(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 3),
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff001EFF),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Reset Kata Sandi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ResetPasswordSuccessDialog {
  static void show(
    BuildContext context, {
    Duration duration = const Duration(seconds: 2),
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // supaya tidak bisa ditutup dengan tap di luar
      builder: (BuildContext context) {
        // ✅ Tutup otomatis setelah durasi tertentu
        Future.delayed(duration, () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(true);
          }

          // ✅ Redirect ke halaman Login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Login()),
          );
        });

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Ikon check di dalam lingkaran hijau
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xff84FF92), // hijau sukses
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Remix.verified_badge_fill,
                    color: Color(0xff076A0E),
                    size: 40,
                  ),
                ),
                const SizedBox(height: 20),

                // ✅ Judul
                const Text(
                  'Kata Sandi Diperbarui!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 5),

                // ✅ Subteks
                const Text(
                  'Kamu sudah dapat menggunakan akun anda kembali and Enjoy!',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
