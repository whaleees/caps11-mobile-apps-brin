import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTypography {
	const AppTypography._();

	static const Color _textPrimary = Color(0xFF000000);
	static const Color _textSecondary = AppColors.secondary700;

	static TextTheme textTheme() {
		return const TextTheme(
			displayLarge: TextStyle(
				fontSize: 52,
				height: 70 / 52,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			headlineLarge: TextStyle(
				fontSize: 38,
				height: 53 / 38,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			headlineMedium: TextStyle(
				fontSize: 32,
				height: 44 / 32,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			headlineSmall: TextStyle(
				fontSize: 24,
				height: 33 / 24,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			titleLarge: TextStyle(
				fontSize: 20,
				height: 28 / 20,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			titleMedium: TextStyle(
				fontSize: 18,
				height: 25 / 18,
				fontWeight: FontWeight.w500,
				letterSpacing: 0,
				color: _textPrimary,
			),
			bodyLarge: TextStyle(
				fontSize: 16,
				height: 22 / 16,
				fontWeight: FontWeight.w400,
				letterSpacing: 0,
				color: _textSecondary,
			),
			bodyMedium: TextStyle(
				fontSize: 14,
				height: 20 / 14,
				fontWeight: FontWeight.w400,
				letterSpacing: 0,
				color: _textSecondary,
			),
			bodySmall: TextStyle(
				fontSize: 12,
				height: 17 / 12,
				fontWeight: FontWeight.w400,
				letterSpacing: 0,
				color: _textSecondary,
			),
			labelLarge: TextStyle(
				fontSize: 14,
				height: 20 / 14,
				fontWeight: FontWeight.w600,
				letterSpacing: 0,
				color: Colors.white,
			),
		);
	}

	static TextStyle get displaySemiBold =>
			textTheme().displayLarge!.copyWith(fontWeight: FontWeight.w600);

	static TextStyle get h1SemiBold =>
			textTheme().headlineLarge!.copyWith(fontWeight: FontWeight.w600);

	static TextStyle get h2SemiBold =>
			textTheme().headlineMedium!.copyWith(fontWeight: FontWeight.w600);

	static TextStyle get h3SemiBold =>
			textTheme().headlineSmall!.copyWith(fontWeight: FontWeight.w600);
}
