import 'package:flutter/material.dart';

class AppColors {
	const AppColors._();

	static const Color red50 = Color(0xFFFDEAEA);
	static const Color red100 = Color(0xFFF7BFBD);
	static const Color red200 = Color(0xFFF49F9D);
	static const Color red300 = Color(0xFFEE7470);
	static const Color red400 = Color(0xFFEB5955);
	static const Color red500 = Color(0xFFE62F2A);
	static const Color red600 = Color(0xFFD12B26);
	static const Color red700 = Color(0xFFA3211E);
	static const Color red800 = Color(0xFF7F1A17);
	static const Color red900 = Color(0xFF611412);

	static const Color secondary50 = Color(0xFFEBEBEC);
	static const Color secondary100 = Color(0xFFC0C2C4);
	static const Color secondary200 = Color(0xFFA2A4A7);
	static const Color secondary300 = Color(0xFF777B7F);
	static const Color secondary400 = Color(0xFF5D6166);
	static const Color secondary500 = Color(0xFF343A40);
	static const Color secondary600 = Color(0xFF2F353A);
	static const Color secondary700 = Color(0xFF25292D);
	static const Color secondary800 = Color(0xFF1D2023);
	static const Color secondary900 = Color(0xFF16181B);

	static const ColorScheme lightColorScheme = ColorScheme(
		brightness: Brightness.light,
		primary: red500,
		onPrimary: Colors.white,
		primaryContainer: red100,
		onPrimaryContainer: red900,
		secondary: secondary500,
		onSecondary: Colors.white,
		secondaryContainer: secondary100,
		onSecondaryContainer: secondary900,
		error: red700,
		onError: Colors.white,
		errorContainer: red100,
		onErrorContainer: red900,
		surface: Colors.white,
		onSurface: secondary900,
		onSurfaceVariant: secondary600,
		outline: secondary300,
		outlineVariant: secondary100,
		shadow: Colors.black,
		scrim: Colors.black,
		inverseSurface: secondary900,
		onInverseSurface: secondary50,
		inversePrimary: red300,
		surfaceTint: red500,
	);
}
