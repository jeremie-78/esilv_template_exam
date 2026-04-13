// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_name => 'Green Track';

  @override
  String get buttons_bar_cancel => 'Annuler';

  @override
  String get buttons_bar_previous => 'Précédent';

  @override
  String get buttons_bar_next => 'Suivant';

  @override
  String get buttons_bar_continue => 'Continuer';

  @override
  String get buttons_bar_compute => 'Calculer';

  @override
  String current_step(int currentStep, int totalSteps) {
    return 'Étape $currentStep / $totalSteps';
  }

  @override
  String get section_transports => 'Déplacements';

  @override
  String get transports_car => 'En voiture';

  @override
  String get transports_car_km_label => 'Kilomètres / an :';

  @override
  String transports_car_km_value(int qty) {
    return '$qty km';
  }

  @override
  String get transports_car_passengers => 'Passagers en moyenne';

  @override
  String get transports_bike => 'A vélo';

  @override
  String get transports_bike_type_electric => 'Électrique';

  @override
  String get transports_bike_type_mechanical => 'Musculaire';

  @override
  String transports_bike_km_value(int qty) {
    return '$qty km';
  }

  @override
  String get section_housing => 'Logement principal';

  @override
  String get housing_characteristics => 'Caractéristiques du logement';

  @override
  String get housing_characteristics_type_label => 'Type :';

  @override
  String get housing_characteristics_type_apartment => 'Appartement';

  @override
  String get housing_characteristics_type_house => 'Maison';

  @override
  String get housing_characteristics_surface_label => 'Surface (m2) :';

  @override
  String get housing_characteristics_surface_hint => 'Ex : 30';

  @override
  String get housing_characteristics_surface_suffix => 'm2';

  @override
  String get housing_heating_source => 'Source de chauffage';

  @override
  String get housing_heating_source_electricity => 'Électricité';

  @override
  String get housing_heating_source_gas => 'Gaz';

  @override
  String get housing_heating_source_wood => 'Bois';

  @override
  String get section_consumption => 'Habitudes d\'achat';

  @override
  String get consumption_food => 'Alimentation';

  @override
  String get consumption_equipment => 'Équipements et textiles';

  @override
  String get consumption_label => 'Vous privilégiez :';

  @override
  String get consumption_new => 'Neuf';

  @override
  String get consumption_second_hand => 'Occasion';

  @override
  String get section_results => 'Votre score';

  @override
  String get score_unit => 'tonnes CO₂/an';

  @override
  String get score_label_excellent => 'Excellent';

  @override
  String get score_label_good => 'Bon';

  @override
  String get score_label_fair => 'Médiocre';

  @override
  String get score_label_poor => 'Mauvais';

  @override
  String get score_label_very_poor => 'Exécrable';

  @override
  String get score_details_title => 'Détail de votre score';

  @override
  String get score_details_label_transports => 'Déplacements';

  @override
  String get score_details_label_housing => 'Logement';

  @override
  String get score_details_label_consumption => 'Consommation';

  @override
  String score_details_value(double value) {
    return '$value t';
  }

  @override
  String get score_compensation_title => 'Compensation';

  @override
  String score_compensation_label(int trees) {
    return 'Il faudrait planter $trees arbres pour compenser votre empreinte actuelle.';
  }
}
