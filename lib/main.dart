import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/pranata_app_bar.dart';
import 'screens/beranda_screen.dart';
import 'screens/tanya_ai_screen.dart';
import 'screens/cek_surat_screen.dart';
import 'screens/buat_surat_screen.dart';

void main() {
  runApp(const PranataApp());
}

class PranataApp extends StatelessWidget {
  const PranataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pranata - Bantuan Hukum Terbuka',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationShell(),
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      BerandaScreen(onNavigateTab: _onTabChanged),
      TanyaAiScreen(onNavigateTab: _onTabChanged),
      CekSuratScreen(onNavigateTab: _onTabChanged),
      const BuatSuratScreen(),
    ];

    return Scaffold(
      appBar: const PranataAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: AppColors.cardBorder, width: 1),
          ),
        ),
        child: NavigationBar(
          height: 68,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onTabChanged,
          backgroundColor: Colors.white,
          indicatorColor: AppColors.softBlueBg,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: AppColors.textMuted),
              selectedIcon: Icon(Icons.home_rounded, color: AppColors.primaryNavy),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(Icons.forum_outlined, color: AppColors.textMuted),
              selectedIcon: Icon(Icons.forum_rounded, color: AppColors.primaryNavy),
              label: 'Tanya AI',
            ),
            NavigationDestination(
              icon: Icon(Icons.document_scanner_outlined, color: AppColors.textMuted),
              selectedIcon: Icon(Icons.document_scanner_rounded, color: AppColors.primaryNavy),
              label: 'Cek Surat',
            ),
            NavigationDestination(
              icon: Icon(Icons.edit_document, color: AppColors.textMuted),
              selectedIcon: Icon(Icons.edit_document, color: AppColors.primaryNavy),
              label: 'Buat Surat',
            ),
          ],
        ),
      ),
    );
  }
}