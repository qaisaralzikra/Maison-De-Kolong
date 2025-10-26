import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

void main() {
  runApp(Registrasi());
}

class Registrasi extends StatelessWidget {
  const Registrasi({super.key});

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
              // 🎨 Background image hanya muncul jika keyboard tidak muncul
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

              // 🧭 Konten utama yang bisa discroll
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.only(
                  bottom: 40,
                ), // biar konten tidak ketutup keyboard
                child: _buildRegistrasiContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildRegistrasiContent(BuildContext context) {
  return // Konten utama
  Column(
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
            // User Field
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 10, right: 10),
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
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(
                    color: Color(0xff000000).withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(
                    Remix.user_line,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
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

            // Phone Field
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10, right: 10),
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
                // obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: TextStyle(
                    color: Color(0xff000000).withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(
                    Remix.phone_line,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
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

            // Email Field
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10, right: 10),
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
                // obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Color(0xff000000).withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(
                    Remix.mail_ai_line,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
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

            // Email Field
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10, right: 10),
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
                // obscureText: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Color(0xff000000).withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(
                    Remix.lock_unlock_line,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
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

            // Email Field
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 10, right: 10),
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Re-Type Password',
                  hintStyle: TextStyle(
                    color: Color(0xff000000).withOpacity(0.4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  prefixIcon: Icon(
                    Remix.verified_badge_line,
                    color: Color(0xff000000).withOpacity(0.4),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
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

            // tomobl signup
            Container(
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
          ],
        ),
      ),
    ],
  );
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
            duration: Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isChecked ? Colors.pinkAccent : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pinkAccent, width: 2),
            ),
            child: isChecked
                ? Icon(Icons.check, color: Colors.white, size: 14)
                : null,
          ),
          SizedBox(width: 10),
          Text(
            'Ingat Saya',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff000000).withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
