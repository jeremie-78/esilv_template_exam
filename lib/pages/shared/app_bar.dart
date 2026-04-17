import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/res/app_icons.dart';
import 'package:green_track/res/app_colors.dart';

class GreenTrackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GreenTrackAppBar({
    super.key,
    this.bottom,
    this.currentStep,
    this.totalSteps,
  });

  final PreferredSizeWidget? bottom;

  // ⬅️ Paramètres optionnels pour afficher le header
  final int? currentStep;
  final int? totalSteps;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 14.0,
        children: <Widget>[
          Icon(AppIcons.app, size: 20.0, color: AppColors.primary),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.app_name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),

      // ⬅️ Si bottom est fourni, on l’utilise
      // Sinon, si currentStep/totalSteps sont fournis, on affiche le header
      bottom: bottom ??
          (currentStep != null && totalSteps != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    color: AppColors.secondary, // fond vert clair
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ÉTAPE ${currentStep!} SUR ${totalSteps!}",
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: currentStep! / totalSteps!,
                            minHeight: 10,
                            backgroundColor: AppColors.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight +
            (bottom?.preferredSize.height ??
                (currentStep != null ? 70 : 0)),
      );
}
