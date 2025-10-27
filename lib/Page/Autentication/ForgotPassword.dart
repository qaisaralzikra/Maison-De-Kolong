import 'package:flutter/material.dart';
import 'package:mainson_de_kolong/Page/Autentication/ResetPassword.dart';
import 'package:remixicon/remixicon.dart';
import 'package:mainson_de_kolong/Page/HomePage/HomePage.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Forgot(),
//     ),
//   );
// }

class Forgot extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  Forgot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const LogoSection(),

              // 🩷 Gambar cup_forgot di bagian bawah
              Positioned(
                bottom: -100,
                child: Image.asset(
                  'assets/image/cup_forgot.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),

              // 📋 Card Lupa Kata Sandi (di atas cup)
              Positioned(
                bottom: 120,
                left: 30,
                right: 30,
                child: Column(
                  children: [
                    const Text(
                      'Lupa Kata Sandi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 232,
                      child: const Text(
                        'Cek Email Kamu Setelah ini, ya. Link Reset Kata Sandi akan kami segera kami kirim!',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 🔹 Input Email
                    Container(
                      width: 192,
                      height: 40,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x66001EFF),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: const Color(0xff000000).withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            Remix.mail_line,
                            color: const Color(0xff000000).withOpacity(0.4),
                            size: 16,
                          ),
                          border: InputBorder.none,
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 40,
                            minHeight: 40,
                          ),
                          contentPadding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 16,
                            right: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // 🔘 Tombol Kirim
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xffFF0004),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 0,
                        ),
                      ),
                      onPressed: () {
                        String email = emailController.text.trim();

                        if (email.isEmpty) {
                          // ⚠️ Tampilkan Snackbar jika kosong
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Email wajib diisi!',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          // ✅ Jika terisi → tampilkan pesan dan pindah halaman
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Link reset terkirim!',
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );

                          // Delay sedikit biar snackbar muncul dulu
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Reset()),
                            );
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 30,
                        ),
                        child: const Text(
                          'Kirim Tautan',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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
      ),
    );
  }
}

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 120,
                height: 100,
                child: Image.asset(
                  'assets/image/logo_kolong.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
