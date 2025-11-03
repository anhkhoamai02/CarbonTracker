import 'package:flutter/material.dart';
import 'voucher_page.dart';

class WalletPage extends StatelessWidget {
  final void Function(int)? onTabSelected;
  const WalletPage({super.key, this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Wallet',
          style: TextStyle(
            color: Color(0xFF4CAF50),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.account_balance_wallet_rounded, color: Colors.grey),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _BalanceCard(balance: 2450, subtitle: '+150 this week'),
            const SizedBox(height: 12),

            // stats
            Row(
              children: const [
                Expanded(child: _MiniStatCard(value: '150', caption: 'This Week')),
                SizedBox(width: 12),
                Expanded(child: _MiniStatCard(value: '685', caption: 'This Month', valueColor: Color(0xFF30A0FB))),
              ],
            ),

            const SizedBox(height: 14),

            // redeem button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF30A0FB),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  onTabSelected?.call(3); // chuyển sang tab VoucherPage
                },
                icon: const Icon(Icons.card_giftcard),
                label: const Text('Redeem Vouchers'),
              ),
            ),

            const SizedBox(height: 16),

            // credit history
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded, size: 18, color: Colors.black87),
                        const SizedBox(width: 8),
                        const Text('Credit History', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  // items
                  const _HistoryItem(
                    icon: Icons.calendar_today_rounded,
                    title: '2 trips - E-Bus, Walking',
                    date: 'Sep 18, 2025',
                    amount: 85,
                    status: _HistoryStatus.earned,
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  const _HistoryItem(
                    icon: Icons.calendar_today_rounded,
                    title: '1 trip - Bicycle',
                    date: 'Sep 17, 2025',
                    amount: 60,
                    status: _HistoryStatus.earned,
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  const _HistoryItem(
                    icon: Icons.card_giftcard,
                    title: 'Redeemed - Coffee Voucher',
                    date: 'Sep 16, 2025',
                    amount: -200,
                    status: _HistoryStatus.redeemed,
                  ),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),

                  const _HistoryItem(
                    icon: Icons.calendar_today_rounded,
                    title: '3 trips - Walking, Petrol Bus, E-Train',
                    date: 'Sep 16, 2025',
                    amount: 120,
                    status: _HistoryStatus.earned,
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===== Widgets =====

class _BalanceCard extends StatelessWidget {
  final int balance;
  final String subtitle;
  const _BalanceCard({required this.balance, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00AD14), Color(0xFF157AC3)],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.account_balance_wallet_rounded,
                  size: 22, color: Colors.white),
              SizedBox(width: 8),
              Flexible( // 👈 cho phép text xuống hàng nếu cần
                child: Text(
                  'Carbon Credits Balance',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _fmt(balance),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  String _fmt(int n) => n
      .toString()
      .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
}


class _MiniStatCard extends StatelessWidget {
  final String value;
  final String caption;
  final Color valueColor;
  const _MiniStatCard({
    super.key,
    required this.value,
    required this.caption,
    this.valueColor = const Color(0xFF4CAF50),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
                color: valueColor,
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Flexible(
            child: Text(
              caption,
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


enum _HistoryStatus { earned, redeemed }

class _HistoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final int amount; // dương = earned, âm = redeemed
  final _HistoryStatus status;

  const _HistoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isEarned = status == _HistoryStatus.earned;
    final amountColor = isEarned ? const Color(0xFF4CAF50) : const Color(0xFFFE4848);
    final badgeColor = isEarned ? const Color(0xFFECF8F0) : const Color(0xFFFDEBEC);
    final badgeText = isEarned ? 'earned' : 'redeemed';
    final leadingBg = isEarned ? const Color(0xFFC9F6C3) : const Color(0xFFFFF0F0);
    final leadingIconColor = isEarned ? const Color(0xFF4CAF50) : const Color(0xFFFE4848);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: leadingBg, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: leadingIconColor, size: 20),
          ),
          const SizedBox(width: 10),

          // title + date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(date, style: TextStyle(
                    color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),

          // amount + badge
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                (amount > 0 ? '+$amount' : '$amount'),
                style: TextStyle(color: amountColor, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    color: amountColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
