import 'package:flutter/material.dart';
import 'package:syntic_earth/views/widgets/appbar/custom_wallet_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: CustomWalletAppBar(title: title, iconData: iconData),
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomWalletAppBar(
                title: "Profile",
                iconData: Icon(Icons.arrow_back_ios_new, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.cyanAccent,
                    child: Icon(Icons.person, size: 40),
                    // backgroundImage: AssetImage(
                    //   'assets/profile.png',
                    // ), // Replace with your image
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00D8A4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Sarwan Khan',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Member since June 2023',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Color(0xFF7F8FA4),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    StatBox(count: '42', label: 'Tiles'),
                    StatBox(count: '88,240', label: 'Portfolio'),
                    StatBox(count: '12', label: 'Trades'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF131A2C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2D2B50),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Achievements',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            AchievementItem(
                              icon: Icons.rocket_launch,
                              label: 'Early Adopter',
                            ),
                            AchievementItem(
                              icon: Icons.swap_horiz,
                              label: 'Trader',
                            ),
                            AchievementItem(
                              icon: Icons.shield,
                              label: 'Investor',
                            ),
                            AchievementItem(
                              icon: Icons.shopping_cart,
                              label: 'First Purchase',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF131A2C),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2D2B50),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: const Text(
                            'Account Settings',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...[
                        'Edit Profile',
                        'Payment Methods',
                        'Security',
                        'Notifications',
                      ].map(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: const Text(
                          'Log Out',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class StatBox extends StatelessWidget {
  final String count;
  final String label;

  const StatBox({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.cyanAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Color(0xFF7F8FA4),
          ),
        ),
      ],
    );
  }
}

class AchievementItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const AchievementItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFF2D2B50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24,
            color: Color(0xFF00F5A0), // Bright neon green/cyan
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
