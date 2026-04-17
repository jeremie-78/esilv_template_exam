import 'package:flutter/material.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_housing.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_transports.dart';
import 'package:green_track/pages/wizard_page/step/wizard_step_consumption.dart';
import 'package:green_track/pages/results_page/results_page.dart';
import 'package:green_track/res/app_colors.dart';

class WizardPage extends StatefulWidget {
  const WizardPage({Key? key}) : super(key: key);

  @override
  _WizardPageState createState() => _WizardPageState();
}

class _WizardPageState extends State<WizardPage> {
  int currentStep = 0;
  final int totalSteps = 3;

  final GlobalKey<WizardStepTransportsState> transportsKey = GlobalKey<WizardStepTransportsState>();
  final GlobalKey<WizardStepHousingState> housingKey = GlobalKey<WizardStepHousingState>();
  final GlobalKey<WizardStepConsumptionState> consumptionKey = GlobalKey<WizardStepConsumptionState>();

  late final Widget transportsStep = WizardStepTransports(key: transportsKey);
  late final Widget housingStep = WizardStepHousing(key: housingKey);
  late final Widget consumptionStep = WizardStepConsumption(key: consumptionKey);

  Widget buildBody() {
    return IndexedStack(
      index: currentStep,
      children: <Widget>[
        transportsStep,
        housingStep,
        consumptionStep,
      ],
    );
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
                  return;
                }
                final transportsState = transportsKey.currentState;
                final housingState = housingKey.currentState;
                final consumptionState = consumptionKey.currentState;
                if (transportsState == null || housingState == null || consumptionState == null) {
                  return;
                }
                final resultsData = ResultsData(
                  carKilometersPerYear: transportsState.kilometrageVoiture,
                  carPassengers: transportsState.selectedPassengers,
                  bikeKilometersPerYear: transportsState.kilometrageVelo,
                  bikeType: transportsState.isMuscular ? BikeType.mechanical : BikeType.electric,
                  housingSurface: housingState.housingSurface,
                  housingType: housingState.isAppart ? HousingType.apartment : HousingType.house,
                  heatingSource: housingState.heatingSource,
                  prefersNewPurchase: consumptionState.prefersNewPurchase,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(data: resultsData)),
                );
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
