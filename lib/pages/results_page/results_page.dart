import 'dart:math';

import 'package:flutter/material.dart';
import 'package:green_track/l10n/app_localizations.dart';
import 'package:green_track/pages/results_page/widgets/score_widget.dart';
import 'package:green_track/pages/shared/app_bar.dart';
import 'package:green_track/res/app_colors.dart';

enum BikeType { mechanical, electric }

enum HousingType { apartment, house }

enum HeatingSource { wood, electricity, gas }

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.data});

  final ResultsData data;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: GreenTrackAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                localizations.section_results,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ScoreWidget(
                  score: data.scoreTonnes,
                  label: data.scoreLabel(context),
                  unit: localizations.score_unit,
                  backgroundColor: data.category.background,
                  borderColor: data.category.border,
                  valueColor: data.category.value,
                ),
              ),
              const SizedBox(height: 32),
              _ScoreDetailCard(data: data),
              const SizedBox(height: 24),
              _CompensationCard(data: data),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsData {
  ResultsData({
    required this.carKilometersPerYear,
    required this.carPassengers,
    required this.bikeKilometersPerYear,
    required this.bikeType,
    required this.housingSurface,
    required this.housingType,
    required this.heatingSource,
    required this.prefersNewPurchase,
  }) {
    _computeDetails();
  }

  final double carKilometersPerYear;
  final int carPassengers;
  final double bikeKilometersPerYear;
  final BikeType bikeType;
  final double housingSurface;
  final HousingType housingType;
  final HeatingSource heatingSource;
  final bool prefersNewPurchase;

  late final double transportKg;
  late final double housingKg;
  late final double consumptionKg;
  late final double totalKg;
  late final double scoreTonnes;
  late final ScoreCategory category;

  void _computeDetails() {
    transportKg = _computeTransportKg();
    housingKg = _computeHousingKg();
    final double baseKg = transportKg + housingKg;
    consumptionKg = prefersNewPurchase ? baseKg * 0.3 : 0.0;
    final double preliminaryKg = baseKg + consumptionKg;
    final double healthBonus = _healthBonusMultiplier();
    totalKg = preliminaryKg * healthBonus;
    scoreTonnes = totalKg / 1000;
    category = _categoryForKg(totalKg);
  }

  double _computeTransportKg() {
    final double carContribution = _computeCarKg();
    final double bikeContribution = _computeBikeKg();
    return carContribution + bikeContribution;
  }

  double _computeCarKg() {
    final int passengers = max(1, carPassengers);
    final double carKg = (carKilometersPerYear * 0.14 + (1 + (passengers - 1) * 0.05)) / passengers;
    return carKg;
  }

  double _computeBikeKg() {
    if (bikeType == BikeType.mechanical) {
      return 0;
    }
    return bikeKilometersPerYear * 0.0015;
  }

  double _computeHousingKg() {
    final double coefficient = housingType == HousingType.apartment ? 0.8 : 1.2;
    final double sourceFactor;
    switch (heatingSource) {
      case HeatingSource.wood:
        sourceFactor = 2;
        break;
      case HeatingSource.electricity:
        sourceFactor = 5;
        break;
      case HeatingSource.gas:
        sourceFactor = 20;
        break;
    }
    return housingSurface * coefficient * sourceFactor / 1000;
  }

  double _healthBonusMultiplier() {
    final int bonusSteps = bikeKilometersPerYear ~/ 1000;
    final double bonus = 0.02 * bonusSteps;
    return max(0.0, 1 - bonus);
  }

  int treesToCompensate() {
    return max(1, (scoreTonnes * 100).round());
  }

  ScoreCategory _categoryForKg(double kg) {
    if (kg <= 500) return ScoreCategory.excellent;
    if (kg <= 1500) return ScoreCategory.good;
    if (kg <= 3000) return ScoreCategory.fair;
    if (kg <= 7999) return ScoreCategory.poor;
    return ScoreCategory.veryPoor;
  }

  String formattedTonnes() => scoreTonnes.toStringAsFixed(1);
}

class _ScoreDetailCard extends StatelessWidget {
  const _ScoreDetailCard({required this.data});

  final ResultsData data;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            localizations.score_details_title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            context,
            icon: Icons.directions_car,
            label: localizations.score_details_label_transports,
            value: data.transportKg / 1000,
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            icon: Icons.home,
            label: localizations.score_details_label_housing,
            value: data.housingKg,
          ),
          const SizedBox(height: 12),
          _buildDetailRow(
            context,
            icon: Icons.shopping_bag,
            label: localizations.score_details_label_consumption,
            value: data.consumptionKg / 1000,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context,
      {required IconData icon, required String label, required double value}) {
    return Row(
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
        Text(
          '${value.toStringAsFixed(1)} t',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _CompensationCard extends StatelessWidget {
  const _CompensationCard({required this.data});

  final ResultsData data;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    final int trees = data.treesToCompensate();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            localizations.score_compensation_title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            localizations.score_compensation_label(trees),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List<Widget>.generate(
              10,
              (int index) => const Icon(
                Icons.park,
                color: AppColors.primary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '+$trees',
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum ScoreCategory { excellent, good, fair, poor, veryPoor }

extension ScoreCategoryStyle on ScoreCategory {
  Color get background {
    switch (this) {
      case ScoreCategory.excellent:
        return AppColors.scoreExcellentBackground;
      case ScoreCategory.good:
        return AppColors.scoreGoodBackground;
      case ScoreCategory.fair:
        return AppColors.scoreFairBackground;
      case ScoreCategory.poor:
        return AppColors.scorePoorBackground;
      case ScoreCategory.veryPoor:
        return AppColors.scoreVeryPoorBackground;
    }
  }

  Color get border {
    switch (this) {
      case ScoreCategory.excellent:
        return AppColors.scoreExcellentBorder;
      case ScoreCategory.good:
        return AppColors.scoreGoodBorder;
      case ScoreCategory.fair:
        return AppColors.scoreFairBorder;
      case ScoreCategory.poor:
        return AppColors.scorePoorBorder;
      case ScoreCategory.veryPoor:
        return AppColors.scoreVeryPoorBorder;
    }
  }

  Color get value {
    switch (this) {
      case ScoreCategory.excellent:
        return AppColors.scoreExcellentValue;
      case ScoreCategory.good:
        return AppColors.scoreGoodValue;
      case ScoreCategory.fair:
        return AppColors.scoreFairValue;
      case ScoreCategory.poor:
        return AppColors.scorePoorValue;
      case ScoreCategory.veryPoor:
        return AppColors.scoreVeryPoorValue;
    }
  }

  String label(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    switch (this) {
      case ScoreCategory.excellent:
        return localizations.score_label_excellent;
      case ScoreCategory.good:
        return localizations.score_label_good;
      case ScoreCategory.fair:
        return localizations.score_label_fair;
      case ScoreCategory.poor:
        return localizations.score_label_poor;
      case ScoreCategory.veryPoor:
        return localizations.score_label_very_poor;
    }
  }
}

extension ResultsDataLabel on ResultsData {
  String scoreLabel(BuildContext context) => category.label(context);
}
