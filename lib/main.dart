import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/profile_model.dart';
import 'screens/portfolio_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProfileData? _profileData;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadProfileData('assets/data/profile_mmoscoso.json');
  }

  Future<void> _loadProfileData(String assetPath) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      setState(() {
        _profileData = ProfileData.fromJson(jsonMap);
      });
    } catch (e) {
      debugPrint('Error loading profile data: $e');
    }
  }

  Color _parseThemeColor(String hexColor) {
    try {
      final hex = hexColor.replaceAll('#', '');
      return Color(int.parse('0xFF$hex'));
    } catch (_) {
      return const Color(0xFF135BEC);
    }
  }

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_profileData == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final data = _profileData!;
    final primaryColor = _parseThemeColor(data.meta.themeColor);

    return MaterialApp(
      title: data.meta.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: Brightness.dark,
        ),
      ),
      home: PortfolioScreen(
        data: data,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
