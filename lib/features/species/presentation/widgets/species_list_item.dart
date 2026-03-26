import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class SpeciesListItem extends StatelessWidget {
	const SpeciesListItem({
		super.key,
		required this.commonName,
		required this.scientificName,
		required this.description,
		required this.imageAssetPath,
		required this.onTap,
	});

	final String commonName;
	final String scientificName;
	final String description;
	final String imageAssetPath;
	final VoidCallback onTap;

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.white,
			borderRadius: BorderRadius.circular(12),
			elevation: 1,
			child: InkWell(
				borderRadius: BorderRadius.circular(12),
				onTap: onTap,
				child: Padding(
					padding: const EdgeInsets.all(10),
					child: Row(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							ClipRRect(
								borderRadius: BorderRadius.circular(8),
								child: Image.asset(
									imageAssetPath,
									width: 52,
									height: 52,
									fit: BoxFit.cover,
								),
							),
							const SizedBox(width: 10),
							Expanded(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(
											commonName,
											style: Theme.of(context).textTheme.titleMedium!.copyWith(
														fontSize: 16,
														fontWeight: FontWeight.w700,
														color: AppColors.secondary800,
													),
										),
										const SizedBox(height: 1),
										Text(
											scientificName,
											style: Theme.of(context).textTheme.bodySmall!.copyWith(
														fontSize: 12,
														color: AppColors.secondary500,
													),
										),
										const SizedBox(height: 3),
										Text(
											description,
											maxLines: 2,
											overflow: TextOverflow.ellipsis,
											style: Theme.of(context).textTheme.bodySmall!.copyWith(
														fontSize: 11,
														height: 1.25,
														color: AppColors.secondary600,
													),
										),
									],
								),
							),
						],
					),
				),
			),
		);
	}
}
