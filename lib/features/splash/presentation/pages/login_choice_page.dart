import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';

class LoginChoicePage extends StatelessWidget {
	const LoginChoicePage({super.key});

	void _enterApp(BuildContext context) {
		Navigator.of(context).pushReplacement(
			MaterialPageRoute<void>(builder: (_) => const HomePage()),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Stack(
				fit: StackFit.expand,
				children: [
					Image.asset(
						'assets/images/splash/splash_background.png',
						fit: BoxFit.cover,
					),
					Container(color: Colors.black.withValues(alpha: 0.15)),
					SafeArea(
						child: Padding(
							padding: const EdgeInsets.fromLTRB(22, 14, 22, 24),
							child: Column(
								children: [
									Text(
										'Invasion Species Detector',
										style: Theme.of(context).textTheme.headlineSmall!.copyWith(
													fontStyle: FontStyle.italic,
													fontWeight: FontWeight.w600,
													color: const Color(0xFF111111),
												),
									),
									const Spacer(),
									Image.asset(
										'assets/images/splash/brin_logo.png',
										width: 270,
										fit: BoxFit.contain,
									),
									const Spacer(flex: 2),
									_AuthButton(
										icon: Icons.g_mobiledata,
										label: 'Masuk dengan Google',
										onTap: () => _enterApp(context),
									),
									const SizedBox(height: 12),
									_AuthButton(
										icon: Icons.mail_outline,
										label: 'Masuk dengan Email',
										onTap: () => _enterApp(context),
									),
									const SizedBox(height: 26),
									TextButton(
										onPressed: () => _enterApp(context),
										style: TextButton.styleFrom(
											foregroundColor: Colors.white,
											backgroundColor: Colors.white.withValues(alpha: 0.25),
											padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
										),
										child: Text(
											'Lewati >',
											style: Theme.of(context).textTheme.bodyMedium!.copyWith(
														color: Colors.white,
														fontWeight: FontWeight.w600,
													),
										),
									),
								],
							),
						),
					),
				],
			),
		);
	}
}

class _AuthButton extends StatelessWidget {
	const _AuthButton({
		required this.icon,
		required this.label,
		required this.onTap,
	});

	final IconData icon;
	final String label;
	final VoidCallback onTap;

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: double.infinity,
			child: OutlinedButton.icon(
				onPressed: onTap,
				icon: Icon(icon, size: 28, color: Colors.white),
				label: Text(
					label,
					style: Theme.of(context).textTheme.bodyLarge!.copyWith(
								color: Colors.white,
								fontWeight: FontWeight.w500,
							),
				),
				style: OutlinedButton.styleFrom(
					side: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
					backgroundColor: Colors.white.withValues(alpha: 0.18),
					minimumSize: const Size.fromHeight(46),
					shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
					alignment: Alignment.centerLeft,
					padding: const EdgeInsets.symmetric(horizontal: 10),
				),
			),
		);
	}
}
