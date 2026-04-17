import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';

class TwoOptionSelector extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final bool? isLeftSelected;
  final ValueChanged<bool?> onChanged;

  const TwoOptionSelector({
    super.key,
    required this.leftLabel,
    required this.rightLabel,
    required this.isLeftSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Bouton gauche
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: isLeftSelected == true ? AppColors.scoreExcellentBorder : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                leftLabel,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Bouton droit
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: isLeftSelected == false ? AppColors.scoreExcellentBorder : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                rightLabel,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
