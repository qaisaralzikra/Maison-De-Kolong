import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPromoPage extends StatefulWidget {
  const DetailPromoPage({Key? key}) : super(key: key);

  @override
  State<DetailPromoPage> createState() => _DetailPromoPageState();
}

class _DetailPromoPageState extends State<DetailPromoPage> {
  // ========== DATA DUMMY ==========
  // Data User
  int userPoints = 500; // Ubah nilai ini untuk testing (coba: 150, 300, 500)
  String userName = "Rajamoehadi";
  
  // Data Voucher
  String voucherTitle = "Kolong Calling ! Diskon 20%";
  String voucherDescription = "Nikmati diskon 20% hingga Rp50K dengan minimal belanja Rp99K. Yuk Pesan Sekarang!";
  int voucherRequiredPoints = 300; // Poin yang dibutuhkan untuk redeem
  String voucherValidUntil = "12 Juli 2025";
  int voucherMinTransaction = 99000;
  // ================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        'Detail Voucher',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Image Placeholder Space for Promo Image
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Promo Title
                    Text(
                      voucherTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Promo Description
                    Text(
                      voucherDescription,
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 25),
                    
                    // Info Card (Berlaku Hingga & Min Transaksi)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Berlaku Hingga
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Berlaku Hingga',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  voucherValidUntil,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // Divider
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.grey.shade300,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                          ),
                          
                          // Min Transaksi
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Min Transaksi',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Rp ${voucherMinTransaction.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Dotted Divider
                    CustomPaint(
                      size: const Size(double.infinity, 1),
                      painter: DottedLinePainter(),
                    ),
                    
                    const SizedBox(height: 30),
                    
                    // Menu Yang Berlaku
                    GestureDetector(
                      onTap: () {
                        _showMenuYangBerlakuBottomSheet(context);
                      },
                      child: _buildExpandableSection(
                        title: 'Menu Yang Berlaku',
                        subtitle: 'Berlaku All Item Food and Beverage',
                      ),
                    ),
                    
                    Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                    
                    const SizedBox(height: 20),
                    
                    // Syarat & Ketentuan
                    GestureDetector(
                      onTap: () {
                        _showSyaratKetentuanBottomSheet(context);
                      },
                      child: _buildExpandableSection(
                        title: 'Syarat & Ketentuan',
                        subtitle: 'Lorem ipsum dolor sit amet, consectetur......',
                      ),
                    ),
                    
                    Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
                    
                    const SizedBox(height: 20),
                    
                    // Cara Pemesanan
                    GestureDetector(
                      onTap: () {
                        _showCaraPemesananBottomSheet(context);
                      },
                      child: _buildExpandableSection(
                        title: 'Cara Pemesanan',
                        subtitle: 'Lorem ipsum dolor sit amet, consectetur......',
                      ),
                    ),
                    
                    const SizedBox(height: 100), // Space for button
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
      // Bottom Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              // SELALU tampilkan pop-up konfirmasi dulu
              _showRedeemConfirmationDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C7CFF),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              'REDEEM SEKARANG',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xFFE91E63),
            size: 28,
          ),
        ],
      ),
    );
  }

  // Pop-up Konfirmasi Redeem Voucher (Tampil Pertama Kali)
  void _showRedeemConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Content
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Question mark icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '?',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Confirmation text
                    Text(
                      'Apakah Anda yakin ingin\nmenukar voucher ini?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                    
                    const SizedBox(height: 25),
                    
                    // Tukar Voucher button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Tutup pop-up konfirmasi
                          
                          // CEK POIN DI SINI
                          if (userPoints >= voucherRequiredPoints) {
                            // Poin cukup - Tampilkan halaman sukses
                            _showSuccessPage(context);
                          } else {
                            // Poin tidak cukup - Tampilkan pop-up peringatan
                            _showInsufficientPointsDialog(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Tukar Voucher',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Tidak button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF8B0000),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Tidak',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Close button
              Positioned(
                top: -10,
                right: -10,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Pop-up Poin Tidak Cukup
  void _showInsufficientPointsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Warning icon (merah dengan tanda seru)
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xFF8B0000),
                        const Color(0xFFB22222),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B0000).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '!',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 25),
                
                // Title
                Text(
                  'Poin Kamu Tidak Cukup!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // Description
                Text(
                  'Poin kamu belum cukup untuk\nmelakukan penukaran.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Kembali button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B0000),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'KEMBALI',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Halaman Sukses Full Screen
  void _showSuccessPage(BuildContext context) {
    // Kurangi poin user
    setState(() {
      userPoints = userPoints - voucherRequiredPoints;
    });
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SuccessRedeemPage(),
      ),
    );
  }

  // Bottom Sheet untuk Menu Yang Berlaku
  void _showMenuYangBerlakuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Menu Yang Berlaku',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE91E63),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const Divider(height: 1, thickness: 1),
              
              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(30),
                  children: [
                    _buildMenuItem(
                      1,
                      'Semua Menu Makanan (Food)',
                    ),
                    _buildMenuItem(
                      2,
                      'Semua Menu Minuman (Beverage)',
                    ),
                    _buildMenuItem(
                      3,
                      'Tidak berlaku untuk Menu Spesial atau Menu Promo Lainnya',
                    ),
                    _buildMenuItem(
                      4,
                      'Berlaku untuk Dine In, Take Away, dan Delivery',
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

  // Bottom Sheet untuk Syarat & Ketentuan
  void _showSyaratKetentuanBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Syarat & Ketentuan',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE91E63),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const Divider(height: 1, thickness: 1),
              
              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(30),
                  children: [
                    _buildTermItem(
                      1,
                      'Voucher ini hanya berlaku untuk pembelian produk tertentu melalui aplikasi Kolong App',
                    ),
                    _buildTermItem(
                      2,
                      'Voucher ini berlaku untuk jangka waktu yang di tentukan',
                    ),
                    _buildTermItem(
                      3,
                      'Voucher ini tidak dapat digunakan untuk tambahan Additional (Sirup, Topping, Susu dan Sebagainya)',
                    ),
                    _buildTermItem(
                      4,
                      'Voucher ini tidak dapat digabung dengan Voucher Lainnya',
                    ),
                    _buildTermItem(
                      5,
                      'Kami dapat mengubah syarat dan ketentuan ini sewaktu-waktu tanpa pemberitahuan terlebih dahulu',
                    ),
                    _buildTermItem(
                      6,
                      'Dengan Menggunakan Voucher ini, anda menyetujui syarat dan ketentuan ini',
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

  // Bottom Sheet untuk Cara Pemesanan
  void _showCaraPemesananBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'Cara Pemesanan',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE91E63),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              const Divider(height: 1, thickness: 1),
              
              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(30),
                  children: [
                    _buildCaraItem(
                      1,
                      'Klik tombol "REDEEM SEKARANG" di bawah halaman ini',
                    ),
                    _buildCaraItem(
                      2,
                      'Pilih menu makanan atau minuman yang ingin dipesan',
                    ),
                    _buildCaraItem(
                      3,
                      'Masukkan voucher saat checkout untuk mendapatkan diskon',
                    ),
                    _buildCaraItem(
                      4,
                      'Pastikan total belanja mencapai minimum transaksi yang ditentukan',
                    ),
                    _buildCaraItem(
                      5,
                      'Selesaikan pembayaran dan tunggu pesanan Anda siap',
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

  Widget _buildTermItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaraItem(int number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ========== HALAMAN SUKSES REDEEM ==========
class SuccessRedeemPage extends StatelessWidget {
  const SuccessRedeemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1D8B31), // Hijau tua
              Color(0xFF1D8B31), // Hijau medium
              Color(0xFF1D8B31), // Hijau terang
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Logo di atas
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/image/logo_maison_de_kolong.png',
                    height: 60,
                    // Jika gambar tidak ada, tampilkan placeholder
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'MAISON\nDE KOLONG',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
              ),
              
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Gambar karakter sukses
                      Image.asset(
                        'assets/image/succes_promo.png',
                        width: 159,
                        height: 222.67,
                        // Jika gambar tidak ada, tampilkan icon
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 280,
                            width: 280,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D8B31),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.celebration,
                              size: 150,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 40),
                      
                      // Title YUHUU!!
                      Text(
                        'YUHUU!!',
                        style: GoogleFonts.montserrat(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Description
                      Text(
                        'Mantap! Poinmu udah berhasil ditukar 🎉',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      Text(
                        'Terus kumpulin poin dari setiap pembelian biar makin banyak reward seru yang bisa kamu dapetin.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Button di bawah (opsional, bisa ditambahkan jika perlu)
              // Padding(
              //   padding: const EdgeInsets.all(30),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.pop(context); // Kembali ke halaman sebelumnya
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.white,
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: Text(
              //       'KEMBALI KE BERANDA',
              //       style: GoogleFonts.montserrat(
              //         color: const Color(0xFF2D8659),
              //         fontSize: 14,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter for Dotted Line
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}