import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  // TODO: Remplacer Center/Text par le bon contenu

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OrganicShapePainter(
        color: AppColors.primary,
        borderColor: AppColors.secondary,
      ),
      child: Center(child: Text('0.4')),
    );
  }
}

class _OrganicShapePainter extends CustomPainter {
  const _OrganicShapePainter({required this.color, required this.borderColor});

  final Color color;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Background
    final Paint paint = Paint()..color = color;
    final RRect rRect = RRect.fromLTRBAndCorners(
      0,
      0,
      w,
      h,
      topLeft: Radius.elliptical(w * 0.60, h * 0.30),
      topRight: Radius.elliptical(w * 0.40, h * 0.67),
      bottomRight: Radius.elliptical(w * 0.70, h * 0.33),
      bottomLeft: Radius.elliptical(w * 0.30, h * 0.70),
    );
    canvas.drawRRect(rRect, paint);

    // Border
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRRect(rRect, borderPaint);
  }

  @override
  bool shouldRepaint(_OrganicShapePainter old) =>
      old.color != color || old.borderColor != borderColor;
}
