import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';
import 'package:green_track/pages/wizard_page/two_options_selector.dart';

/// Widgets à utiliser :
/// - [Slider]
/// - [FilledButton]
class WizardStepConsumption extends StatefulWidget {
  @override
  _WizardStepConsumptionState createState() => _WizardStepConsumptionState();
}

class _WizardStepConsumptionState extends  State<WizardStepConsumption> {
  bool? isNew;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Habitude d'achat", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.primary)),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(children:[
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: AppColors.scoreGoodBorder,
                borderRadius: BorderRadius.all(Radius.circular(10),
              )),
              child: Icon(AppIcons.car, color: AppColors.primaryDark),
            ),
            SizedBox(width: 20),
            Text("Equipements et textiles", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ]),
        ),   
        Container(
          width: double.infinity,
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.all(16.0),  
          decoration: BoxDecoration(
                color: AppColors.cardBackground, 
                borderRadius: BorderRadius.all(Radius.circular(10),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Vous privilégiez:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary)),
              SizedBox(height: 10),
              TwoOptionSelector(leftLabel: "Neuf", rightLabel: "Occasion", isLeftSelected: isNew, onChanged: (v) {setState(() => isNew = v);}),
            ],
          ),
        ),
    ],);
  }
}
