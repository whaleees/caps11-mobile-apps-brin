import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_typography.dart';
import '../../../map/presentation/pages/map_page.dart';
import '../../../observation/presentation/pages/take_photo_page.dart';
import '../../../species/presentation/pages/species_list_page.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	int _selectedIndex = 0;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFFF6F6F7),
			body: SafeArea(
				child: IndexedStack(
					index: _selectedIndex,
					children: [
						_buildHomeTab(context),
						const SpeciesListPage(),
						const MapPage(),
						const _SimpleTab(title: 'Profile'),
					],
				),
			),
			bottomNavigationBar: NavigationBar(
				selectedIndex: _selectedIndex,
				onDestinationSelected: (index) {
					setState(() {
						_selectedIndex = index;
					});
				},
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

	Widget _buildHomeTab(BuildContext context) {
		return Column(
			children: [
				Container(
					width: double.infinity,
					padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
					decoration: const BoxDecoration(
						color: AppColors.red500,
						borderRadius: BorderRadius.only(
							bottomLeft: Radius.circular(20),
							bottomRight: Radius.circular(20),
						),
					),
					child: Column(
						children: [
							Row(
								children: [
									Expanded(
										child: Text(
											'Hello, Joe!',
											style: AppTypography.h2SemiBold.copyWith(
												color: Colors.white,
												fontSize: 36,
												height: 1.2,
											),
										),
									),
									Container(
										height: 38,
										width: 38,
										decoration: const BoxDecoration(
											color: Color(0xFFD9DCE0),
											shape: BoxShape.circle,
										),
										child: const Icon(Icons.notifications_none, size: 20),
									),
								],
							),
							const SizedBox(height: 10),
							Align(
								alignment: Alignment.centerLeft,
								child: Text(
									'Monitor and report invasive species',
									style: Theme.of(context).textTheme.bodyMedium!.copyWith(
												color: Colors.white,
												fontSize: 14,
											),
								),
							),
						],
					),
				),
				Expanded(
					child: SingleChildScrollView(
						padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
						child: Column(
							children: [
								const _StatCard(
									title: 'Total Species Recorded',
									value: '127',
									icon: Icons.eco,
								),
								const SizedBox(height: 12),
								const _StatCard(
									title: 'Total Reports Submitted',
									value: '342',
									icon: Icons.description,
								),
								const SizedBox(height: 12),
								const _StatCard(
									title: 'Affected Locations',
									value: '89',
									icon: Icons.location_on,
								),
								const SizedBox(height: 18),
								SizedBox(
									width: double.infinity,
									child: ElevatedButton.icon(
										onPressed: () => _showReportOptions(context),
										icon: const Icon(Icons.add, size: 20),
										label: Text(
											'Report Observation',
											style: Theme.of(context)
													.textTheme
													.bodyLarge!
													.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
										),
										style: ElevatedButton.styleFrom(
											backgroundColor: AppColors.red500,
											foregroundColor: Colors.white,
											minimumSize: const Size.fromHeight(48),
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(30),
											),
											elevation: 3,
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

	Future<void> _showReportOptions(BuildContext context) async {
		await showDialog<void>(
			context: context,
			barrierColor: Colors.black.withValues(alpha: 0.35),
			builder: (context) {
				return Dialog(
					backgroundColor: Colors.white,
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
					child: Padding(
						padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 28),
						child: Column(
							mainAxisSize: MainAxisSize.min,
							children: [
								_ActionOption(
									icon: Icons.photo_camera,
									label: 'Take Photo',
									onTap: () {
										Navigator.of(context).pop();
										Navigator.of(this.context).push(
											MaterialPageRoute<void>(
												builder: (_) => const TakePhotoPage(),
											),
										);
									},
								),
								const SizedBox(height: 18),
								_ActionOption(
									icon: Icons.image,
									label: 'Select Image',
									onTap: () {
										Navigator.of(context).pop();
										ScaffoldMessenger.of(this.context).showSnackBar(
											const SnackBar(content: Text('Select image action is coming soon.')),
										);
									},
								),
							],
						),
					),
				);
			},
		);
	}
}

class _StatCard extends StatelessWidget {
	const _StatCard({
		required this.title,
		required this.value,
		required this.icon,
	});

	final String title;
	final String value;
	final IconData icon;

	@override
	Widget build(BuildContext context) {
		return Container(
			width: double.infinity,
			padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.circular(14),
				border: Border.all(color: const Color(0xFFE8EAED)),
			),
			child: Row(
				children: [
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									title,
									style: Theme.of(context).textTheme.bodySmall!.copyWith(
												color: const Color(0xFF80858C),
												fontSize: 13,
											),
								),
								const SizedBox(height: 4),
								Text(
									value,
									style: AppTypography.h2SemiBold.copyWith(fontSize: 42, height: 1),
								),
							],
						),
					),
					Container(
						height: 46,
						width: 46,
						decoration: const BoxDecoration(
							color: AppColors.red100,
							shape: BoxShape.circle,
						),
						child: Icon(icon, color: AppColors.red500, size: 23),
					),
				],
			),
		);
	}
}

class _ActionOption extends StatelessWidget {
	const _ActionOption({
		required this.icon,
		required this.label,
		required this.onTap,
	});

	final IconData icon;
	final String label;
	final VoidCallback onTap;

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
			borderRadius: BorderRadius.circular(60),
			child: Column(
				children: [
					Container(
						height: 104,
						width: 104,
						decoration: BoxDecoration(
							shape: BoxShape.circle,
							border: Border.all(color: const Color(0xFFADB3BA)),
						),
						child: Icon(icon, size: 36),
					),
					const SizedBox(height: 10),
					Text(
						label,
						style: Theme.of(context).textTheme.titleMedium!.copyWith(
									fontSize: 28,
									fontWeight: FontWeight.w500,
								),
					),
				],
			),
		);
	}
}

class _SimpleTab extends StatelessWidget {
	const _SimpleTab({required this.title});

	final String title;

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				'$title page coming soon',
				style: Theme.of(context).textTheme.headlineSmall,
			),
		);
	}
}
