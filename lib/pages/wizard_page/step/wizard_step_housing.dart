import 'package:flutter/material.dart';
import 'package:green_track/res/app_colors.dart';
import 'package:green_track/res/app_icons.dart';
import 'package:green_track/pages/results_page/results_page.dart';
import 'package:green_track/pages/wizard_page/two_options_selector.dart';

/// Widgets à utiliser :
/// - [FilledButton]
/// - [TextField]
/// - [RadioGroup] avec [Radio] (regarder la doc de [RadioListTile])
class WizardStepHousing extends StatefulWidget {
  const WizardStepHousing({Key? key}) : super(key: key);

  @override
  WizardStepHousingState createState() => WizardStepHousingState();
}


class WizardStepHousingState extends State<WizardStepHousing> {
  bool isAppart = true;
  int selectedEnergy = 0; // 0 = Bois, 1 = Gaz, 2 = Électrique
  final TextEditingController surfaceController = TextEditingController(text: '30');

  double get housingSurface => double.tryParse(surfaceController.text) ?? 0.0;

  HeatingSource get heatingSource {
    switch (selectedEnergy) {
      case 1:
        return HeatingSource.gas;
      case 2:
        return HeatingSource.electricity;
      default:
        return HeatingSource.wood;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Logement principal", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.primary)),
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
              child: Icon(AppIcons.house, color: AppColors.primaryDark),
            ),
            SizedBox(width: 20),
            Text("Caractéristique", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ]),
        ),   
        Container(
          width: double.infinity,
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.all(16.0),  
          decoration: BoxDecoration(
                color: AppColors.cardBackground, 
                borderRadius: BorderRadius.all(Radius.circular(10),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Type:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary), textAlign: TextAlign.left),
              SizedBox(height: 10),
              TwoOptionSelector(leftLabel: "Appartment", rightLabel: "Maison", isLeftSelected: isAppart, onChanged: (bool? v) {setState(() => isAppart = v ?? true);} ),
              SizedBox(height: 10),
              Text("Surface(m2):", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primary), textAlign: TextAlign.left),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(
                      AppIcons.squareFoot, // triangle
                      color: AppColors.primaryDark,
                      size: 22,
                    ),
                    SizedBox(width: 12),

                    // Champ de saisie
                    Expanded(
                      child: TextField(
                        controller: surfaceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Ex: 30",
                          hintStyle: TextStyle(color: AppColors.disabled),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(width: 12),

                    Text(
                      "m²",
                      style: TextStyle(
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
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
              child: Icon(AppIcons.heating, color: AppColors.primaryDark),
            ),
            SizedBox(width: 20),
            Text("Source de chauffage ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.primary)),
          ]),
        ),   
        SizedBox(height: 30),
        Container(
          width: double.infinity,
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.all(16.0),  
          decoration: BoxDecoration(
                color: AppColors.cardBackground, 
                borderRadius: BorderRadius.all(Radius.circular(10),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedEnergy = 0),
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedEnergy == 0 ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedEnergy == 0
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selectedEnergy == 0 ? Colors.white : AppColors.primary,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Bois",
                        style: TextStyle(
                          color: selectedEnergy == 0 ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => setState(() => selectedEnergy = 1),
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedEnergy == 1 ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedEnergy == 1
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selectedEnergy == 1 ? Colors.white : AppColors.primary,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Gaz",
                        style: TextStyle(
                          color: selectedEnergy == 1 ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              
              GestureDetector(
                onTap: () => setState(() => selectedEnergy = 2),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  decoration: BoxDecoration(
                    color: selectedEnergy == 2 ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primary, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedEnergy == 2
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: selectedEnergy == 2 ? Colors.white : AppColors.primary,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Électrique",
                        style: TextStyle(
                          color: selectedEnergy == 2 ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )

        ),
    ],);
  }
}
