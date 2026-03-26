import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../observation/data/observation_report_store.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    this.commonName = 'Unknown Species',
    this.scientificName = 'Unknown species',
    this.showBackButton = false,
    this.closeOnConfirm = false,
  });

  final String commonName;
  final String scientificName;
  final bool showBackButton;
  final bool closeOnConfirm;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController _mapController;
  static const LatLng _defaultCenter = LatLng(-7.2892, 112.7344);

  LatLng _selectedLocation = _defaultCenter;
  double _zoom = 13.5;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _zoomIn() {
    setState(() {
      _zoom = (_zoom + 1).clamp(3.0, 18.0);
    });
    _mapController.move(_selectedLocation, _zoom);
  }

  void _zoomOut() {
    setState(() {
      _zoom = (_zoom - 1).clamp(3.0, 18.0);
    });
    _mapController.move(_selectedLocation, _zoom);
  }

  void _goToSelected() {
    _mapController.move(_selectedLocation, _zoom);
  }

  void _confirmLocation() {
    ObservationReportStore.instance.addReport(
      ObservationReport(
        commonName: widget.commonName,
        scientificName: widget.scientificName,
        location: _selectedLocation,
        observedAt: DateTime.now(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Observation location saved.')),
    );

    if (widget.closeOnConfirm && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 28,
                child: widget.showBackButton
                    ? IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back, size: 22),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: Text(
                  'Observation Location',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary800,
                      ),
                ),
              ),
              const SizedBox(width: 22),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _defaultCenter,
                    initialZoom: _zoom,
                    minZoom: 3,
                    maxZoom: 18,
                    onTap: (_, point) {
                      setState(() {
                        _selectedLocation = point;
                      });
                    },
                    onPositionChanged: (position, _) {
                      _zoom = position.zoom;
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.brin_mobile_apps',
                    ),
                    ValueListenableBuilder<List<ObservationReport>>(
                      valueListenable: ObservationReportStore.instance.reports,
                      builder: (context, reports, _) {
                        return MarkerLayer(
                          markers: [
                            ...reports.map(
                              (report) => Marker(
                                point: report.location,
                                width: 26,
                                height: 26,
                                child: const Icon(
                                  Icons.location_on,
                                  size: 24,
                                  color: AppColors.red300,
                                ),
                              ),
                            ),
                            Marker(
                              point: _selectedLocation,
                              width: 52,
                              height: 52,
                              child: const Icon(
                                Icons.location_on,
                                size: 52,
                                color: AppColors.red500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 18,
                right: 18,
                bottom: 22,
                child: _LocationInfoCard(
                  commonName: widget.commonName,
                  scientificName: widget.scientificName,
                  latitude: _selectedLocation.latitude,
                  longitude: _selectedLocation.longitude,
                  onZoomIn: _zoomIn,
                  onZoomOut: _zoomOut,
                  onLocate: _goToSelected,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color(0xFFF6F6F7),
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _confirmLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red500,
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    'Confirm Location',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Location will be saved with your observation data',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.secondary500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LocationInfoCard extends StatelessWidget {
  const _LocationInfoCard({
    required this.commonName,
    required this.scientificName,
    required this.latitude,
    required this.longitude,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onLocate,
  });

  final String commonName;
  final String scientificName;
  final double latitude;
  final double longitude;
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onLocate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.red50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.eco, color: AppColors.red500, size: 25),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commonName,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.secondary800,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      scientificName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.secondary500,
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(height: 7),
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      text: _formatCoordinates(latitude, longitude),
                    ),
                    const SizedBox(height: 5),
                    const _InfoRow(
                      icon: Icons.calendar_month,
                      text: 'March 25, 2019 - 2.13 PM',
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '175m',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.secondary500,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Column(
              children: [
                _MapControlButton(icon: Icons.add, onTap: onZoomIn),
                const SizedBox(height: 8),
                _MapControlButton(icon: Icons.remove, onTap: onZoomOut),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: _MapControlButton(icon: Icons.my_location, onTap: onLocate),
          ),
        ],
      ),
    );
  }
}

class _MapControlButton extends StatelessWidget {
  const _MapControlButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Icon(icon, size: 18, color: AppColors.secondary700),
        ),
      ),
    );
  }
}

String _formatCoordinates(double latitude, double longitude) {
  final latDirection = latitude >= 0 ? 'N' : 'S';
  final lonDirection = longitude >= 0 ? 'E' : 'W';
  final lat = latitude.abs().toStringAsFixed(6);
  final lon = longitude.abs().toStringAsFixed(6);
  return '$lat $latDirection, $lon $lonDirection';
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.red500),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.secondary500,
                  fontSize: 12,
                ),
          ),
        ),
      ],
    );
  }
}
