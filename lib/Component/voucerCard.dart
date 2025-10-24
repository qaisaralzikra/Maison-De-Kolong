import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  final Widget child;

  const VoucherCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketShapePainter(),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}

class TicketShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // potongan sisi kiri dan kanan
    const radius = 10.0;
    path.addArc(
      Rect.fromCircle(center: Offset(0, size.height / 2), radius: radius),
      -1.5 * 3.14,
      3.14,
    );
    path.addArc(
      Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: radius),
      0.5 * 3.14,
      3.14,
    );

    canvas.drawShadow(path, Colors.grey.withOpacity(0.4), 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
