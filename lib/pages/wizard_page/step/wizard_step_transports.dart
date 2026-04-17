import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';
import 'package:green_track/pages/wizard_page/passenger_selector.dart';
import 'package:green_track/pages/wizard_page/two_options_selector.dart';



/// Widgets à utiliser :
/// - [FilledButton]
/// 
class WizardStepTransports extends StatefulWidget {
  const WizardStepTransports({Key? key}) : super(key: key);

  @override
  WizardStepTransportsState createState() => WizardStepTransportsState();
}

class WizardStepTransportsState extends State<WizardStepTransports> {
  double kilometrageVoiture = 12000;
  int selectedPassengers = 1;
  double kilometrageVelo = 1000;
  bool isMuscular = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Déplacements", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.primary)),
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
            Text("En voiture", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary)),
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
            children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kilomètres / an:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary)),
                  Text("${kilometrageVoiture.round()} km", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary))
                ],
              ),
              SizedBox(height: 10),
              Slider(
                value: kilometrageVoiture,
                min: 0,
                max: 15000,
                divisions: 150,
                activeColor: AppColors.scoreGoodBorder,
                inactiveColor: AppColors.white,
                onChanged: (v) {
                  setState(() => kilometrageVoiture = v);
                },
              ),
              SizedBox(height: 10),
              PassengerSelector(
                selected: selectedPassengers, 
                onChanged: (v) {
                  setState(() => selectedPassengers = v);
                },
              )
            ],
          ),
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
              child: Icon(AppIcons.bike, color: AppColors.primaryDark),
            ),
            SizedBox(width: 20),
            Text("En vélo", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ]),
        ),   
        SizedBox(height: 30),
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
            children: [
              TwoOptionSelector(leftLabel: "Musculaire", rightLabel: "Electrique", isLeftSelected: isMuscular, onChanged: (bool? v) {setState(() => isMuscular = v ?? true);} ),
              SizedBox(height: 10),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kilomètres / an:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary)),
                  Text("${kilometrageVelo.round()} km", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary))
                ],
              ),
              SizedBox(height: 10),
              Slider(
                value: kilometrageVelo,
                min: 0,
                max: 10000,
                divisions: 150,
                activeColor: AppColors.scoreGoodBorder,
                inactiveColor: AppColors.white,
                onChanged: (v) {
                  setState(() => kilometrageVelo = v);
                },
              )
            ],
          ),
        ),
    ],);
  }
}
