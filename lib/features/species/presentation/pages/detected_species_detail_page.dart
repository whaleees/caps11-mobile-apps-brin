import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../map/presentation/pages/map_page.dart';

class DetectedSpeciesDetailPage extends StatelessWidget {
	const DetectedSpeciesDetailPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF6F6F7),
			appBar: AppBar(
				leading: IconButton(
					onPressed: () => Navigator.of(context).pop(),
					icon: const Icon(Icons.arrow_back),
				),
				title: const Text('Species Detail'),
				centerTitle: true,
			),
			body: SingleChildScrollView(
				child: Column(
					children: [
						SizedBox(
							height: 195,
							width: double.infinity,
							child: Image.network(
								'https://images.unsplash.com/photo-1512428813834-c702c7702b78?auto=format&fit=crop&w=1200&q=80',
								fit: BoxFit.cover,
							),
						),
						Transform.translate(
							offset: const Offset(0, -14),
							child: Container(
								width: double.infinity,
								margin: const EdgeInsets.symmetric(horizontal: 10),
								padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
								decoration: BoxDecoration(
									color: const Color(0xFFF3F3F4),
									borderRadius: BorderRadius.circular(16),
								),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(
											'Purple Loosestrife',
											style: Theme.of(context).textTheme.headlineSmall!.copyWith(
														fontSize: 38,
														fontWeight: FontWeight.w600,
														color: AppColors.secondary800,
													),
										),
										const SizedBox(height: 2),
										Text(
											'Lythrum salicaria',
											style: Theme.of(context).textTheme.titleMedium!.copyWith(
														color: AppColors.secondary500,
														fontStyle: FontStyle.italic,
														fontSize: 18,
													),
										),
										const SizedBox(height: 8),
										Text(
											'High Risk',
											style: Theme.of(context).textTheme.bodyMedium!.copyWith(
														color: AppColors.red500,
														fontWeight: FontWeight.w700,
													),
										),
										const SizedBox(height: 12),
										Text(
											'Purple loosestrife is an aggressive perennial wetland plant that forms\ndense stands, crowding out native vegetation and reducing biodiversity in\nwetland ecosystems.',
											style: Theme.of(context).textTheme.bodyMedium!.copyWith(
														color: AppColors.secondary600,
														height: 1.4,
													),
										),
										const SizedBox(height: 14),
										Text(
											'Key Characteristics',
											style: Theme.of(context).textTheme.titleMedium!.copyWith(
														fontWeight: FontWeight.w700,
														color: AppColors.secondary800,
													),
										),
										const SizedBox(height: 10),
										const _CharacteristicItem(
											icon: Icons.eco,
											iconColor: Color(0xFF33B16A),
											title: 'Height',
											subtitle: '2-8 feet tall',
										),
										const _CharacteristicItem(
											icon: Icons.auto_awesome,
											iconColor: Color(0xFFB97FF4),
											title: 'Flowers',
											subtitle: 'Purple-magenta, 4-6 petals, in dense spikes',
										),
										const _CharacteristicItem(
											icon: Icons.spa,
											iconColor: Color(0xFF5BB97A),
											title: 'Leaves',
											subtitle: 'Lance-shaped, opposite or whorled arrangement',
										),
										const _CharacteristicItem(
											icon: Icons.location_on,
											iconColor: Color(0xFF5C8DF7),
											title: 'Habitat',
											subtitle: 'Wetlands, marshes, stream banks, ditches',
										),
										const _CharacteristicItem(
											icon: Icons.calendar_month,
											iconColor: Color(0xFFEF8B38),
											title: 'Bloom Time',
											subtitle: 'July to September',
										),
										const SizedBox(height: 12),
										SizedBox(
											width: double.infinity,
											child: ElevatedButton.icon(
														onPressed: () {
															Navigator.of(context).push(
																MaterialPageRoute<void>(
																	builder: (_) => const Scaffold(
																		body: SafeArea(
																			child: MapPage(
																				commonName: 'Purple Loosestrife',
																				scientificName: 'Lythrum salicaria',
																				showBackButton: true,
																				closeOnConfirm: true,
																			),
																		),
																	),
																),
															);
														},
												icon: const Icon(Icons.warning_amber, size: 18),
												label: Text(
													'Report This Species',
													style: Theme.of(context).textTheme.bodyLarge!.copyWith(
																color: Colors.white,
																fontWeight: FontWeight.w600,
															),
												),
												style: ElevatedButton.styleFrom(
													backgroundColor: AppColors.red500,
													foregroundColor: Colors.white,
													minimumSize: const Size.fromHeight(48),
													shape: RoundedRectangleBorder(
														borderRadius: BorderRadius.circular(10),
													),
													elevation: 0,
												),
											),
										),
										const SizedBox(height: 8),
										Center(
											child: Text(
												'Help track invasive species in your area',
												style: Theme.of(context).textTheme.bodySmall!.copyWith(
															color: AppColors.secondary500,
														),
											),
										),
									],
								),
							),
						),
					],
				),
			),
			bottomNavigationBar: NavigationBar(
				selectedIndex: 1,
				onDestinationSelected: (_) {},
				backgroundColor: Colors.white,
				indicatorColor: AppColors.red50,
				labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
				destinations: const [
					NavigationDestination(
						icon: Icon(Icons.home_outlined),
						selectedIcon: Icon(Icons.home),
						label: 'Home',
					),
					NavigationDestination(
						icon: Icon(Icons.menu_book_outlined),
						selectedIcon: Icon(Icons.menu_book),
						label: 'Species',
					),
					NavigationDestination(
						icon: Icon(Icons.map_outlined),
						selectedIcon: Icon(Icons.map),
						label: 'Map',
					),
					NavigationDestination(
						icon: Icon(Icons.person_outline),
						selectedIcon: Icon(Icons.person),
						label: 'Profile',
					),
				],
			),
		);
	}
}

class _CharacteristicItem extends StatelessWidget {
	const _CharacteristicItem({
		required this.icon,
		required this.iconColor,
		required this.title,
		required this.subtitle,
	});

	final IconData icon;
	final Color iconColor;
	final String title;
	final String subtitle;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.only(bottom: 10),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Container(
						width: 28,
						height: 28,
						decoration: BoxDecoration(
							shape: BoxShape.circle,
							color: iconColor.withValues(alpha: 0.18),
						),
						child: Icon(icon, size: 16, color: iconColor),
					),
					const SizedBox(width: 10),
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									title,
									style: Theme.of(context).textTheme.bodyLarge!.copyWith(
												fontWeight: FontWeight.w600,
												color: AppColors.secondary800,
											),
								),
								Text(
									subtitle,
									style: Theme.of(context).textTheme.bodySmall!.copyWith(
												color: AppColors.secondary600,
												height: 1.3,
											),
								),
							],
						),
					),
				],
			),
		);
	}
}
