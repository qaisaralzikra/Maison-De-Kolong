import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/Autentication/OTPPage.dart';
import 'package:mainson_de_kolong/main.dart';
import 'package:remixicon/remixicon.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    retypePasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context) {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final retypePassword = retypePasswordController.text.trim();

    // 🔍 Validasi isi field
    if (name.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        retypePassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua field'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // 🔍 Validasi password sama
    if (password != retypePassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password tidak cocok'),
          backgroundColor: Colors.orangeAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // ✅ Semua valid
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registrasi berhasil!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );

    // Tunggu sebentar agar SnackBar sempat tampil
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OTPPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/image/cair_biru.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(bottom: 40),
                  // ⬇️ penting: context di sini sudah valid untuk SnackBar
                  child: _buildRegistrasiContent(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrasiContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo
        Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: SizedBox(
            width: 95,
            height: 75,
            child: Image.asset(
              'assets/image/logo_kolong.png',
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Judul
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            'We Say Hello!',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // Deskripsi
        Container(
          width: 290,
          child: Text(
            'Welcome Back, Use Your Email and Password to Log In',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),

        // Input fields
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              _buildTextField(
                controller: nameController,
                hintText: 'Name',
                icon: Remix.user_line,
              ),
              _buildTextField(
                controller: phoneController,
                hintText: 'Phone',
                icon: Remix.phone_line,
                marginTop: 30,
              ),
              _buildTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Remix.mail_ai_line,
                marginTop: 30,
              ),
              _buildTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Remix.lock_unlock_line,
                obscure: true,
                marginTop: 30,
              ),
              _buildTextField(
                controller: retypePasswordController,
                hintText: 'Re-Type Password',
                icon: Remix.verified_badge_line,
                obscure: true,
                marginTop: 30,
              ),

              // Tombol Sign Up
              GestureDetector(
                onTap: () => _handleSignUp(context),
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                  decoration: BoxDecoration(
                    color: Color(0xffFF0087),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscure = false,
    double marginTop = 0,
  }) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: marginTop),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0x66001EFF),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff000000).withOpacity(0.4),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: Icon(icon, color: Color(0xff000000).withOpacity(0.4)),
          border: InputBorder.none,
          prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
          contentPadding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 16,
            right: 16,
          ),
        ),
      ),
    );
  }
}
