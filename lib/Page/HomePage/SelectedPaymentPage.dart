import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class SelectedPaymentPage extends StatelessWidget {
  final String selectedPayment;

  const SelectedPaymentPage({super.key, required this.selectedPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pilih Pembayaran',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selected Payment (Dynamic)
            if (selectedPayment.isNotEmpty)
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _getPaymentIcon(selectedPayment),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedPayment,
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Baru',
                                style: GoogleFonts.montserrat(
                                  fontSize: 11,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xffFF008C),
                          width: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Divider
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
              height: 1,
            ),

            // Metode Pembayaran Lainnya
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: Text(
                'Metode Pembayaran Lainnya',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Show all payment methods EXCEPT the selected one
            ...['QRIS', 'GoPay', 'OVO', 'DANA']
                .where((method) => method != selectedPayment)
                .map((method) {
              Color color;
              IconData? icon;
              String? customIcon;

              switch (method) {
                case 'QRIS':
                  color = Colors.white;
                  customIcon = 'QRIS';
                  break;
                case 'GoPay':
                  color = Color(0xff00AED6);
                  icon = Remix.wallet_3_fill;
                  break;
                case 'OVO':
                  color = Color(0xff4F1AB5);
                  customIcon = 'O';
                  break;
                case 'DANA':
                  color = Color(0xff0081C9);
                  icon = Remix.wallet_fill;
                  break;
                default:
                  color = Colors.grey;
              }

              return Column(
                children: [
                  _buildPaymentOption(
                    context,
                    method,
                    color,
                    icon,
                    customIcon: customIcon,
                  ),
                  if (method != 'DANA' ||
                      (selectedPayment != 'QRIS' &&
                          selectedPayment != 'GoPay' &&
                          selectedPayment != 'OVO'))
                    Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                      height: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                ],
              );
            }).toList(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String name,
    Color color,
    IconData? icon, {
    String? customIcon,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, name);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: name == 'QRIS'
                        ? Border.all(color: Colors.grey.shade300, width: 1)
                        : null,
                    boxShadow: name == 'QRIS'
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: color.withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                  ),
                  child: Center(
                    child: customIcon != null
                        ? Text(
                            customIcon,
                            style: GoogleFonts.montserrat(
                              fontSize: customIcon == 'QRIS' ? 12 : 26,
                              fontWeight: FontWeight.bold,
                              color: customIcon == 'QRIS'
                                  ? Colors.black
                                  : Colors.white,
                              letterSpacing: customIcon == 'QRIS' ? 0.5 : 0,
                            ),
                          )
                        : Icon(
                            icon,
                            color: Colors.white,
                            size: 30,
                          ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Aktifkan Sekarang',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xffFF008C),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPaymentIcon(String payment) {
    switch (payment) {
      case 'QRIS':
        return Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'QRIS',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );
      case 'OVO':
        return Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xff4F1AB5),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff4F1AB5).withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'O',
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      case 'GoPay':
        return Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xff00AED6),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff00AED6).withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Remix.wallet_3_fill,
            color: Colors.white,
            size: 30,
          ),
        );
      case 'DANA':
        return Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xff0081C9),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xff0081C9).withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Remix.wallet_fill,
            color: Colors.white,
            size: 30,
          ),
        );
      default:
        return Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
        );
    }
  }
}