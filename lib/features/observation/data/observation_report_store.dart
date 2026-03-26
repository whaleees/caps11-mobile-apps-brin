import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class ObservationReport {
  const ObservationReport({
    required this.commonName,
    required this.scientificName,
    required this.location,
    required this.observedAt,
  });

  final String commonName;
  final String scientificName;
  final LatLng location;
  final DateTime observedAt;
}

class ObservationReportStore {
  ObservationReportStore._();

  static final ObservationReportStore instance = ObservationReportStore._();

  final ValueNotifier<List<ObservationReport>> reports = ValueNotifier<List<ObservationReport>>([
    ObservationReport(
      commonName: 'Vachellia nilotica',
      scientificName: 'Vachellia nilotica',
      location: const LatLng(-7.2751, 112.7509),
      observedAt: DateTime(2026, 3, 20, 9, 12),
    ),
    ObservationReport(
      commonName: 'Lantana camara',
      scientificName: 'Lantana camara',
      location: const LatLng(-7.3016, 112.7354),
      observedAt: DateTime(2026, 3, 22, 14, 5),
    ),
    ObservationReport(
      commonName: 'Ageratum conyzoides',
      scientificName: 'Ageratum conyzoides',
      location: const LatLng(-7.2881, 112.7186),
      observedAt: DateTime(2026, 3, 24, 8, 40),
    ),
  ]);

  void addReport(ObservationReport report) {
    reports.value = [...reports.value, report];
  }
}
