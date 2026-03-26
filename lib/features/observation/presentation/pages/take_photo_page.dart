import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../species/presentation/pages/detected_species_detail_page.dart';

class TakePhotoPage extends StatefulWidget {
	const TakePhotoPage({super.key});

	@override
	State<TakePhotoPage> createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
	Timer? _timer;

	@override
	void initState() {
		super.initState();
		_timer = Timer(const Duration(seconds: 2), () {
			if (!mounted) {
				return;
			}
			Navigator.of(context).push(
				MaterialPageRoute<void>(
					builder: (_) => const DetectedSpeciesDetailPage(),
				),
			);
		});
	}

	@override
	void dispose() {
		_timer?.cancel();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF6F6F7),
			appBar: AppBar(
				leading: IconButton(
					onPressed: () => Navigator.of(context).pop(),
					icon: const Icon(Icons.arrow_back),
				),
				title: const Text('Take Photo'),
				centerTitle: true,
			),
			body: Column(
				children: [
					Container(height: 48, color: Colors.white),
					Container(
						width: double.infinity,
						color: const Color(0xFFD3D3D3),
						padding: const EdgeInsets.symmetric(vertical: 34),
						child: Center(
							child: Container(
								width: 196,
								height: 196,
								decoration: BoxDecoration(
									borderRadius: BorderRadius.circular(10),
									border: Border.all(color: Colors.white, width: 2),
									image: const DecorationImage(
										fit: BoxFit.cover,
										image: NetworkImage(
											'https://images.unsplash.com/photo-1512428813834-c702c7702b78?auto=format&fit=crop&w=800&q=80',
										),
									),
								),
							),
						),
					),
					Expanded(
						child: Padding(
							padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
							child: Column(
								children: [
									Text(
										'Analyzing Image . . .',
										style: Theme.of(context).textTheme.titleLarge!.copyWith(
													color: AppColors.secondary700,
													fontSize: 32,
													fontWeight: FontWeight.w600,
												),
									),
									const SizedBox(height: 14),
									Text(
										'The AI model is identifying the species. This\nmay take a few seconds.',
										textAlign: TextAlign.center,
										style: Theme.of(context).textTheme.bodyMedium!.copyWith(
													color: AppColors.secondary400,
													fontSize: 14,
												),
									),
								],
							),
						),
					),
				],
			),
			bottomNavigationBar: NavigationBar(
				selectedIndex: 0,
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
