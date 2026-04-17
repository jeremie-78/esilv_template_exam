import 'package:flutter/material.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_housing.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_transports.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_consumption.dart';
import 'package:green_track/pages/results_page/results_page.dart';
import 'package:green_track/res/app_colors.dart';

class WizardPage extends StatefulWidget {
  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  int currentStep = 0;
  final int totalSteps = 3;

  Widget buildBody() {
    switch (currentStep) {
      case 0:
        return WizardStepTransports();
      case 1:
        return WizardStepHousing();
      case 2:
        return WizardStepConsumption();
      default:
        return Center(child: Text("Terminé !"));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: GreenTrackAppBar(
      currentStep: currentStep + 1,
      totalSteps: 3,
    ), 
    body: Column(
      children: [
        Expanded(child: buildBody()),
      ],
    ),
    bottomNavigationBar: Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (currentStep > 0) {
                  setState(() => currentStep--);
                }
              },
              child: Text(
                currentStep == 0 ? "Annuler" : "Retour",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          SizedBox(width: 16),

          Expanded(
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryDark,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                if (currentStep < 2) {
                  setState(() => currentStep++);
                }
                else
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultsPage()),
                  );
                }
              },
              child: Text(
                currentStep == 2 ? "Calculer" : "Continuer",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
