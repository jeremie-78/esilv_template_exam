import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
    required this.label,
    required this.unit,
    required this.backgroundColor,
    required this.borderColor,
    required this.valueColor,
  });

  final double score;
  final String label;
  final String unit;
  final Color backgroundColor;
  final Color borderColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 260,
      child: CustomPaint(
        painter: _OrganicShapePainter(
          color: backgroundColor,
          borderColor: borderColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                score.toStringAsFixed(1),
                style: TextStyle(
                  color: valueColor,
                  fontSize: 56,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                unit,
                style: TextStyle(
                  color: valueColor.withOpacity(0.65),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                decoration: BoxDecoration(
                  color: valueColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
