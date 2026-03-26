import 'dart:async';

import 'package:flutter/material.dart';

import 'login_choice_page.dart';

class SplashPage extends StatefulWidget {
	const SplashPage({super.key});

	@override
	State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
	Timer? _timer;

	@override
	void initState() {
		super.initState();
		_timer = Timer(const Duration(seconds: 2), () {
			if (!mounted) {
				return;
			}
			Navigator.of(context).pushReplacement(
				MaterialPageRoute<void>(builder: (_) => const LoginChoicePage()),
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
			backgroundColor: const Color(0xFFF7F7F7),
			body: SafeArea(
				child: Padding(
					padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
					child: Column(
						children: [
							const Spacer(flex: 3),
							Image.asset(
								'assets/images/splash/brin_logo.png',
								width: 250,
								fit: BoxFit.contain,
							),
							const SizedBox(height: 14),
							Text(
								'Invasion Species Detector',
								style: Theme.of(context).textTheme.headlineSmall!.copyWith(
											fontStyle: FontStyle.italic,
											fontWeight: FontWeight.w500,
											color: const Color(0xFF1A1A1A),
										),
							),
							const Spacer(flex: 4),
							Text(
								'Loading . . .',
								style: Theme.of(context).textTheme.headlineSmall!.copyWith(
											fontStyle: FontStyle.italic,
											fontWeight: FontWeight.w500,
											color: const Color(0xFF1A1A1A),
										),
							),
							const Spacer(),
						],
					),
				),
			),
		);
	}
}
