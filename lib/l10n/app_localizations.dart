import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('fr')];

  /// No description provided for @app_name.
  ///
  /// In fr, this message translates to:
  /// **'Green Track'**
  String get app_name;

  /// No description provided for @buttons_bar_cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get buttons_bar_cancel;

  /// No description provided for @buttons_bar_previous.
  ///
  /// In fr, this message translates to:
  /// **'Précédent'**
  String get buttons_bar_previous;

  /// No description provided for @buttons_bar_next.
  ///
  /// In fr, this message translates to:
  /// **'Suivant'**
  String get buttons_bar_next;

  /// No description provided for @buttons_bar_continue.
  ///
  /// In fr, this message translates to:
  /// **'Continuer'**
  String get buttons_bar_continue;

  /// No description provided for @buttons_bar_compute.
  ///
  /// In fr, this message translates to:
  /// **'Calculer'**
  String get buttons_bar_compute;

  /// No description provided for @current_step.
  ///
  /// In fr, this message translates to:
  /// **'Étape {currentStep} / {totalSteps}'**
  String current_step(int currentStep, int totalSteps);

  /// No description provided for @section_transports.
  ///
  /// In fr, this message translates to:
  /// **'Déplacements'**
  String get section_transports;

  /// No description provided for @transports_car.
  ///
  /// In fr, this message translates to:
  /// **'En voiture'**
  String get transports_car;

  /// No description provided for @transports_car_km_label.
  ///
  /// In fr, this message translates to:
  /// **'Kilomètres / an :'**
  String get transports_car_km_label;

  /// No description provided for @transports_car_km_value.
  ///
  /// In fr, this message translates to:
  /// **'{qty} km'**
  String transports_car_km_value(int qty);

  /// No description provided for @transports_car_passengers.
  ///
  /// In fr, this message translates to:
  /// **'Passagers en moyenne'**
  String get transports_car_passengers;

  /// No description provided for @transports_bike.
  ///
  /// In fr, this message translates to:
  /// **'A vélo'**
  String get transports_bike;

  /// No description provided for @transports_bike_type_electric.
  ///
  /// In fr, this message translates to:
  /// **'Électrique'**
  String get transports_bike_type_electric;

  /// No description provided for @transports_bike_type_mechanical.
  ///
  /// In fr, this message translates to:
  /// **'Musculaire'**
  String get transports_bike_type_mechanical;

  /// No description provided for @transports_bike_km_value.
  ///
  /// In fr, this message translates to:
  /// **'{qty} km'**
  String transports_bike_km_value(int qty);

  /// No description provided for @section_housing.
  ///
  /// In fr, this message translates to:
  /// **'Logement principal'**
  String get section_housing;

  /// No description provided for @housing_characteristics.
  ///
  /// In fr, this message translates to:
  /// **'Caractéristiques du logement'**
  String get housing_characteristics;

  /// No description provided for @housing_characteristics_type_label.
  ///
  /// In fr, this message translates to:
  /// **'Type :'**
  String get housing_characteristics_type_label;

  /// No description provided for @housing_characteristics_type_apartment.
  ///
  /// In fr, this message translates to:
  /// **'Appartement'**
  String get housing_characteristics_type_apartment;

  /// No description provided for @housing_characteristics_type_house.
  ///
  /// In fr, this message translates to:
  /// **'Maison'**
  String get housing_characteristics_type_house;

  /// No description provided for @housing_characteristics_surface_label.
  ///
  /// In fr, this message translates to:
  /// **'Surface (m2) :'**
  String get housing_characteristics_surface_label;

  /// No description provided for @housing_characteristics_surface_hint.
  ///
  /// In fr, this message translates to:
  /// **'Ex : 30'**
  String get housing_characteristics_surface_hint;

  /// No description provided for @housing_characteristics_surface_suffix.
  ///
  /// In fr, this message translates to:
  /// **'m2'**
  String get housing_characteristics_surface_suffix;

  /// No description provided for @housing_heating_source.
  ///
  /// In fr, this message translates to:
  /// **'Source de chauffage'**
  String get housing_heating_source;

  /// No description provided for @housing_heating_source_electricity.
  ///
  /// In fr, this message translates to:
  /// **'Électricité'**
  String get housing_heating_source_electricity;

  /// No description provided for @housing_heating_source_gas.
  ///
  /// In fr, this message translates to:
  /// **'Gaz'**
  String get housing_heating_source_gas;

  /// No description provided for @housing_heating_source_wood.
  ///
  /// In fr, this message translates to:
  /// **'Bois'**
  String get housing_heating_source_wood;

  /// No description provided for @section_consumption.
  ///
  /// In fr, this message translates to:
  /// **'Habitudes d\'achat'**
  String get section_consumption;

  /// No description provided for @consumption_food.
  ///
  /// In fr, this message translates to:
  /// **'Alimentation'**
  String get consumption_food;

  /// No description provided for @consumption_equipment.
  ///
  /// In fr, this message translates to:
  /// **'Équipements et textiles'**
  String get consumption_equipment;

  /// No description provided for @consumption_label.
  ///
  /// In fr, this message translates to:
  /// **'Vous privilégiez :'**
  String get consumption_label;

  /// No description provided for @consumption_new.
  ///
  /// In fr, this message translates to:
  /// **'Neuf'**
  String get consumption_new;

  /// No description provided for @consumption_second_hand.
  ///
  /// In fr, this message translates to:
  /// **'Occasion'**
  String get consumption_second_hand;

  /// No description provided for @section_results.
  ///
  /// In fr, this message translates to:
  /// **'Votre score'**
  String get section_results;

  /// No description provided for @score_unit.
  ///
  /// In fr, this message translates to:
  /// **'tonnes CO₂/an'**
  String get score_unit;

  /// No description provided for @score_label_excellent.
  ///
  /// In fr, this message translates to:
  /// **'Excellent'**
  String get score_label_excellent;

  /// No description provided for @score_label_good.
  ///
  /// In fr, this message translates to:
  /// **'Bon'**
  String get score_label_good;

  /// No description provided for @score_label_fair.
  ///
  /// In fr, this message translates to:
  /// **'Médiocre'**
  String get score_label_fair;

  /// No description provided for @score_label_poor.
  ///
  /// In fr, this message translates to:
  /// **'Mauvais'**
  String get score_label_poor;

  /// No description provided for @score_label_very_poor.
  ///
  /// In fr, this message translates to:
  /// **'Exécrable'**
  String get score_label_very_poor;

  /// No description provided for @score_details_title.
  ///
  /// In fr, this message translates to:
  /// **'Détail de votre score'**
  String get score_details_title;

  /// No description provided for @score_details_label_transports.
  ///
  /// In fr, this message translates to:
  /// **'Déplacements'**
  String get score_details_label_transports;

  /// No description provided for @score_details_label_housing.
  ///
  /// In fr, this message translates to:
  /// **'Logement'**
  String get score_details_label_housing;

  /// No description provided for @score_details_label_consumption.
  ///
  /// In fr, this message translates to:
  /// **'Consommation'**
  String get score_details_label_consumption;

  /// No description provided for @score_details_value.
  ///
  /// In fr, this message translates to:
  /// **'{value} t'**
  String score_details_value(double value);

  /// No description provided for @score_compensation_title.
  ///
  /// In fr, this message translates to:
  /// **'Compensation'**
  String get score_compensation_title;

  /// No description provided for @score_compensation_label.
  ///
  /// In fr, this message translates to:
  /// **'Il faudrait planter {trees} arbres pour compenser votre empreinte actuelle.'**
  String score_compensation_label(int trees);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
