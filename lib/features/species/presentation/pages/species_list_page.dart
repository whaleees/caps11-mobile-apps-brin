import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../widgets/species_list_item.dart';
import 'species_detail_page.dart';

class SpeciesData {
	const SpeciesData({
		required this.commonName,
		required this.scientificName,
		required this.description,
		required this.imageAssetPath,
	});

	final String commonName;
	final String scientificName;
	final String description;
	final String imageAssetPath;
}

const List<SpeciesData> kSpeciesData = [
	SpeciesData(
		commonName: 'Vachellia nilotica',
		scientificName: 'Vachellia nilotica',
		description:
				'Spiny tree that can spread rapidly and dominate grasslands, reducing forage quality.',
		imageAssetPath: 'assets/images/species/vachellia_nilotica.png',
	),
	SpeciesData(
		commonName: 'Ageratum conyzoides',
		scientificName: 'Ageratum conyzoides',
		description:
				'Fast-growing herb that invades disturbed land and competes with native understory plants.',
		imageAssetPath: 'assets/images/species/ageratum_conyzoides.png',
	),
	SpeciesData(
		commonName: 'Lantana camara',
		scientificName: 'Lantana camara',
		description:
				'Dense, thorny shrub that blocks regeneration and is toxic to grazing animals.',
		imageAssetPath: 'assets/images/species/lantana_camara.png',
	),
	SpeciesData(
		commonName: 'Clitoria ternatea',
		scientificName: 'Clitoria ternatea',
		description:
				'Climbing vine that can overgrow surrounding vegetation when unmanaged in open areas.',
		imageAssetPath: 'assets/images/species/clitoria_ternatea.png',
	),
	SpeciesData(
		commonName: 'Merremia hederacea',
		scientificName: 'Merremia hederacea',
		description:
				'Twining vine capable of smothering shrubs and young trees in secondary growth habitats.',
		imageAssetPath: 'assets/images/species/merremia_hederacea.png',
	),
];

class SpeciesListPage extends StatefulWidget {
	const SpeciesListPage({super.key});

	@override
	State<SpeciesListPage> createState() => _SpeciesListPageState();
}

class _SpeciesListPageState extends State<SpeciesListPage> {
	String _query = '';

	@override
	Widget build(BuildContext context) {
		final filtered = kSpeciesData.where((species) {
			final q = _query.toLowerCase().trim();
			if (q.isEmpty) {
				return true;
			}
			return species.commonName.toLowerCase().contains(q) ||
					species.scientificName.toLowerCase().contains(q);
		}).toList();

		return Column(
			children: [
				Container(
					color: Colors.white,
					width: double.infinity,
					padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
					child: Text(
						'Manage Species',
						textAlign: TextAlign.center,
						style: Theme.of(context).textTheme.titleLarge!.copyWith(
									fontWeight: FontWeight.w700,
									color: AppColors.secondary800,
								),
					),
				),
				Expanded(
					child: Container(
						color: const Color(0xFFF6F6F7),
						child: ListView(
							padding: const EdgeInsets.fromLTRB(14, 12, 14, 18),
							children: [
								Container(
									decoration: BoxDecoration(
										color: const Color(0xFFEDEEF0),
										borderRadius: BorderRadius.circular(8),
									),
									child: TextField(
										onChanged: (value) => setState(() => _query = value),
										style: Theme.of(context).textTheme.bodyMedium,
										decoration: InputDecoration(
											hintText: 'Search invasive species...',
											hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
														color: AppColors.secondary400,
													),
											contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
											border: InputBorder.none,
										),
									),
								),
								const SizedBox(height: 12),
								...filtered.map(
									(species) => Padding(
										padding: const EdgeInsets.only(bottom: 10),
										child: SpeciesListItem(
											commonName: species.commonName,
											scientificName: species.scientificName,
											description: species.description,
											imageAssetPath: species.imageAssetPath,
											onTap: () {
												Navigator.of(context).push(
													MaterialPageRoute<void>(
														builder: (_) => SpeciesDetailPage(species: species),
													),
												);
											},
										),
									),
								),
							],
						),
					),
				),
			],
		);
	}
}
