import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/portfolio_bottom_bar.dart';

class PortfolioScreen extends StatelessWidget {
  final ProfileData data;
  final VoidCallback? onToggleTheme;

  const PortfolioScreen({
    super.key,
    required this.data,
    this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final scaffoldBg = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: primaryColor.withValues(alpha: 0.1),
            child: Icon(
              Icons.star,
              color: primaryColor,
              size: 20,
            ),
          ),
        ),
        title: Text(
          data.meta.appTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: scaffoldBg.withAlpha(230),
        toolbarHeight: 56,
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? const Color(0xFF9E9E9E) : const Color(0xFF616161),
            ),
            onPressed: onToggleTheme ?? () {},
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                HeroSection(
                  hero: data.hero,
                  primaryColor: primaryColor,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),
                AboutSection(
                  personal: data.personal,
                  primaryColor: primaryColor,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),
                ExperienceSection(
                  experience: data.experience,
                  primaryColor: primaryColor,
                  isDark: isDark,
                ),
                const SizedBox(height: 32),
                ProjectsSection(
                  projects: data.projects,
                  primaryColor: primaryColor,
                  isDark: isDark,
                ),
                const SizedBox(height: 40),
                ContactSection(
                  contact: data.contact,
                  primaryColor: primaryColor,
                  isDark: isDark,
                ),
                const SizedBox(height: 80), // Padding to avoid FAB overlap
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: PortfolioBottomBar(
        primaryColor: primaryColor,
        isDark: isDark,
      ),
    );
  }
}
