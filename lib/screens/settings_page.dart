import 'package:flutter/material.dart';
import 'onboard_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool locationEnabled = true;
  bool tripReminders = true;
  bool weeklyGoals = true;
  bool newVouchers = false;
  bool achievementUnlocked = true;

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
          'Settings',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.settings_outlined, color: Colors.grey),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // PROFILE
            _buildProfileCard(),

            const SizedBox(height: 16),

            // PREFERENCES
            _buildCard(
              title: "Preferences",
              child: Column(
                children: [
                  _buildPreferenceRow(
                    icon: Icons.straighten,
                    title: "Distance Unit",
                    subtitle: "Choose kilometers or miles",
                    trailingText: "Kilometers",
                  ),
                  const Divider(height: 1),
                  _buildPreferenceRow(
                    icon: Icons.public,
                    title: "Emission Region",
                    subtitle: "CO₂ calculation factors",
                    trailingText: "Vietnam",
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    secondary: const Icon(Icons.location_on_outlined, color: Colors.grey),
                    title: const Text(
                      "Location Services",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text("For automatic trip detection"),
                    value: locationEnabled,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() => locationEnabled = value);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // NOTIFICATIONS
            _buildCard(
              title: "Notifications",
              icon: Icons.notifications_none,
              child: Column(
                children: [
                  _buildSwitchRow(
                    title: "Trip Reminders",
                    subtitle: "Get reminded to track your trips",
                    value: tripReminders,
                    onChanged: (v) => setState(() => tripReminders = v),
                  ),
                  const Divider(height: 1),
                  _buildSwitchRow(
                    title: "Weekly Goals",
                    subtitle: "Notifications about your progress",
                    value: weeklyGoals,
                    onChanged: (v) => setState(() => weeklyGoals = v),
                  ),
                  const Divider(height: 1),
                  _buildSwitchRow(
                    title: "New Vouchers",
                    subtitle: "When new rewards are available",
                    value: newVouchers,
                    onChanged: (v) => setState(() => newVouchers = v),
                  ),
                  const Divider(height: 1),
                  _buildSwitchRow(
                    title: "Achievement Unlocked",
                    subtitle: "When you reach milestones",
                    value: achievementUnlocked,
                    onChanged: (v) => setState(() => achievementUnlocked = v),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // PRIVACY & SUPPORT SECTION
            _buildCard(
              child: Column(
                children: [
                  _buildListItem(Icons.lock_outline, "Privacy & Security"),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),
                  _buildListItem(Icons.help_outline, "Help & Support"),
                  const Divider(height: 1, color: Color(0xFFE0E0E0)),
                  _buildListItem(Icons.mail_outline, "Contact Us"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PROFILE CARD
  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.person, color: Colors.black),
              SizedBox(width: 6),
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green,
                child: Text(
                  "KM",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Khoa Mai",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "anhkhoa@gmail.com",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Color(0xFF30A0FB),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Eco Warrior",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // CARD TEMPLATE
  Widget _buildCard({String? title, IconData? icon, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, color: Colors.black),
                  const SizedBox(width: 6),
                ],
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          child,
        ],
      ),
    );
  }

  // ROW BUILDERS
  Widget _buildPreferenceRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required String trailingText,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          trailingText,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green,
    );
  }

  Widget _buildListItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
