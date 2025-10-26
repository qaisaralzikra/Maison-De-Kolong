import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mainson_de_kolong/Page/Autentication/ForgotPassword.dart';
import 'package:mainson_de_kolong/Page/Autentication/Registrasi.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ✅ Controller harus disimpan di State, bukan di build()
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // jangan lupa dispose biar gak bocor memori
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              if (MediaQuery.of(context).viewInsets.bottom == 0)
                Positioned(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/image/cair_pink.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.only(bottom: 40),
                child: _buildLoginContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Logo
        Container(
          margin: const EdgeInsets.only(top: 30),
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
          margin: const EdgeInsets.only(top: 25),
          child: Text(
            'We Say Hello!',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
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
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        // Input fields
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            children: [
              // Email Field
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x99FF008C),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: const Color(0xff000000).withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(
                      Remix.mail_ai_line,
                      color: const Color(0xff000000).withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 16,
                      right: 16,
                    ),
                  ),
                ),
              ),

              // Password Field
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x99FF008C),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: const Color(0xff000000).withOpacity(0.4),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    prefixIcon: Icon(
                      Remix.lock_unlock_line,
                      color: const Color(0xff000000).withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 16,
                      right: 16,
                    ),
                  ),
                ),
              ),

              // ✅ “Ingat Saya” Section
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: RememberMeWidget(),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0, // tanpa bayangan
                          backgroundColor:
                              Colors.white, // tanpa warna background
                          shadowColor:
                              Colors.white, // pastikan tidak ada efek shadow
                          splashFactory: NoSplash
                              .splashFactory, // hilangkan efek klik ripple
                          padding: EdgeInsets.zero, // rapikan padding
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Forgot()),
                          );
                        },
                        child: const Text(
                          'Fotgot Password',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Tombol Login
              GestureDetector(
                onTap: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  print('Email: $email');
                  print('Password: $password');
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 80,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff001EFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // Bagian bawah tetap sama
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Or Login With',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'assets/image/logo_google.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          const Text(
                            'Don’t have an account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Registrasi(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
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
      ],
    );
  }
}

// 🔘 Widget Custom untuk “Ingat Saya”
class RememberMeWidget extends StatefulWidget {
  @override
  _RememberMeWidgetState createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isChecked = !isChecked);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isChecked ? Colors.pinkAccent : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pinkAccent, width: 2),
            ),
            child: isChecked
                ? const Icon(Icons.check, color: Colors.white, size: 14)
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            'Ingat Saya',
            style: TextStyle(
              fontSize: 14,
              color: const Color(0xff000000).withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
