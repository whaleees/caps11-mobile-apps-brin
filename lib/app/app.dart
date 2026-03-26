import 'package:flutter/material.dart';

import '../features/splash/presentation/pages/splash_page.dart';
import 'theme/app_theme.dart';

class App extends StatelessWidget {
	const App({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'BRIN Mobile Apps',
			theme: AppTheme.light,
			home: const SplashPage(),
		);
	}
}
