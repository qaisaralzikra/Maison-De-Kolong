import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                children: [
                  // Title - Centered
                  Text(
                    'KOLONG REDEEM',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  
                  // Profile Card with Points and Ellipse
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Main Card
                      Container(
                        margin: const EdgeInsets.only(top: 30, left: 20),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 50), // Space for ellipse
                            
                            // Name
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hai,',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    'Rajamoehadi',
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
                              width: 2,
                              height: 50,
                              color: const Color(0xFFE91E63),
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                            ),
                            
                            // Points Section with Cup
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/image/cup_poin.png',
                                  width: 40,
                                  height: 61,
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'KOLONG POINT',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '0',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFFE91E63),
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      'PTS',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Ellipse Profile Picture - Overlapping top left
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFE91E63),
                              width: 3,
                            ),
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Container(
                              color: Colors.grey.shade200,
                              // Placeholder for profile image
                              // Replace with actual image:
                              // child: Image.asset('assets/profile_image.png', fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Reward Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KOLONG',
                    style: GoogleFonts.montserrat(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                      letterSpacing: 1,
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
                  const SizedBox(height: 20),
                  
                  // Promo Cards
                  _buildPromoCard(
                    title: 'Kolong Calling ! Diskon 20%',
                    maxDiscount: 'Maksimum Rp50k',
                    validUntil: 'Berlaku Hingga',
                    date: '5 Jam',
                    minTransaction: 'Min Transaksi',
                    minAmount: 'Rp. 99.000',
                    isExpiringSoon: true,
                  ),
                  const SizedBox(height: 15),
                  
                  _buildPromoCard(
                    title: 'Kolong Calling ! Diskon 20%',
                    maxDiscount: 'Maksimum Rp50k',
                    validUntil: 'Berlaku Hingga',
                    date: '12 Juli 2025',
                    minTransaction: 'Min Transaksi',
                    minAmount: 'Rp. 99.000',
                  ),
                  const SizedBox(height: 15),
                  
                  _buildPromoCard(
                    title: 'Kolong Calling ! Diskon 20%',
                    maxDiscount: 'Maksimum Rp50k',
                    validUntil: 'Berlaku Hingga',
                    date: '12 Juli 2025',
                    minTransaction: 'Min Transaksi',
                    minAmount: 'Rp. 99.000',
                  ),
                  const SizedBox(height: 100), // Space for bottom nav
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard({
    required String title,
    required String maxDiscount,
    required String validUntil,
    required String date,
    required String minTransaction,
    required String minAmount,
    bool isExpiringSoon = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE3E3E3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                '/Users/user/Maison-De-Kolong/assets/image/logo_maison_de_kolong.png',
                width: 35,
                height: 35,
              ),
            ],
          ),
          const SizedBox(height: 5),
          
          // Max Discount
          Text(
            maxDiscount,
            style: GoogleFonts.montserrat(
              fontSize: 13,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 15),
          
          // Details and Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Left side - dates and amount
              Expanded(
                child: Row(
                  children: [
                    // Valid Until
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          validUntil,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 12,
                              color: isExpiringSoon 
                                  ? const Color(0xFFE91E63) 
                                  : Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              date,
                              style: GoogleFonts.montserrat(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isExpiringSoon 
                                    ? const Color(0xFFE91E63) 
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    
                    // Min Transaction
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          minTransaction,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Text(
                          minAmount,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Tukar Button
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailPromoPage()));
                },
                child: (
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF66BA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Tukar',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}