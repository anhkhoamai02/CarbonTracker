import 'package:flutter/material.dart';
import 'home_page.dart';
import 'trip_history_page.dart';
import 'wallet_page.dart';
import 'settings_page.dart';
import 'voucher_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(onTabSelected: (i) => setState(() => index = i)),
      const TripHistoryPage(),
      WalletPage(onTabSelected: (i) => setState(() => index = i)), // 👈 thêm ở đây
      const VoucherPage(),
      const SettingsPage(),
    ];
  }


  Widget _buildNavIcon(IconData icon, int i) {
    final bool isSelected = index == i;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFC9F6C3) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF21A366) : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF21A366),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: _buildNavIcon(Icons.home_outlined, 0),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: _buildNavIcon(Icons.history_outlined, 1),
          ),
          BottomNavigationBarItem(
            label: 'Wallet',
            icon: _buildNavIcon(Icons.account_balance_wallet_outlined, 2),
          ),
          BottomNavigationBarItem(
            label: 'Voucher',
            icon: _buildNavIcon(Icons.card_giftcard_outlined, 3),
          ),
          BottomNavigationBarItem(
            label: 'Setting',
            icon: _buildNavIcon(Icons.settings_outlined, 4),
          ),
        ],
      ),


    );
  }
}

class _StubPage extends StatelessWidget {
  final String title;
  const _StubPage({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Text('$title page')
        )
    );
  }
}