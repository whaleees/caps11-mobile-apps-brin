import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import 'species_list_page.dart';

class SpeciesDetailPage extends StatelessWidget {
	const SpeciesDetailPage({super.key, required this.species});

	final SpeciesData species;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF6F6F7),
			appBar: AppBar(
				leading: IconButton(
					onPressed: () => Navigator.of(context).pop(),
					icon: const Icon(Icons.arrow_back),
				),
				title: const Text('Manage Species'),
				centerTitle: true,
			),
			body: Column(
				children: [
					Expanded(
						child: SingleChildScrollView(
							padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									ClipRRect(
										borderRadius: BorderRadius.circular(10),
										child: Image.asset(
											species.imageAssetPath,
											width: double.infinity,
											height: 214,
											fit: BoxFit.cover,
										),
									),
									const SizedBox(height: 14),
									Center(
										child: Text(
											species.commonName,
											style: Theme.of(context).textTheme.headlineSmall!.copyWith(
														fontWeight: FontWeight.w700,
														fontSize: 38,
														color: AppColors.secondary800,
													),
											textAlign: TextAlign.center,
										),
									),
									const SizedBox(height: 4),
									Center(
										child: Text(
											species.scientificName,
											style: Theme.of(context).textTheme.titleMedium!.copyWith(
														fontStyle: FontStyle.italic,
														color: AppColors.secondary500,
													),
										),
									),
									const SizedBox(height: 14),
									Text(
										'${species.commonName} is monitored as a potentially invasive species. It can spread quickly in disturbed habitats and compete with local flora if not controlled. Regular reporting and early detection are important to reduce ecological impact.\n\nIn field observations, record growth pattern, flower and leaf morphology, and surrounding habitat conditions to support verification and management response.',
										style: Theme.of(context).textTheme.bodyMedium!.copyWith(
													color: AppColors.secondary700,
													height: 1.4,
													fontSize: 13,
												),
									),
								],
							),
						),
					),
				],
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
