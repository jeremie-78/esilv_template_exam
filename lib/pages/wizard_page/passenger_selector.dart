import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';



class PassengerSelector extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onChanged;

  const PassengerSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [1, 2, 3, 4, 5];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: options.map((value) {
        final bool isSelected = selected == value;

        return GestureDetector(
          onTap: () => onChanged(value),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.scoreGoodBackground : AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppColors.primaryDark : AppColors.disabled,
                width: 2,
              ),
            ),
            child: Text(
              value == 5 ? "5+" : value.toString(),
              style: TextStyle(
                color: isSelected ? AppColors.primaryDark : AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
