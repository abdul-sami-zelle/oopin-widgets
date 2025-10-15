import 'package:flutter/material.dart';

class CustomSidebar extends StatelessWidget {
  const CustomSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // === MAIN CONTENT ===
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // === USER HEADER ===
              Container(
                width: 260,
                // height: 70,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Profile image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color(0xFFFAFAFA),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/person-img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // User Info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Smith",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "smith123@gmail.com",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text(
                          "England",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              // Divider
              Container(
                width: 260,
                height: 1,
                color: Colors.white.withOpacity(0.8),
              ),
              const SizedBox(height: 10),

              // === MENU ITEMS ===
              _navItem(icon: Icons.home_outlined, label: "Dashboard"),
              _navItem(icon: Icons.wallet_rounded, label: "Your Wallet"),
              _navItem(icon: Icons.call, label: "Call history"),
              _navItem(icon: Icons.analytics_outlined, label: "Claims"),
              _navItem(icon: Icons.notifications_none, label: "Notifications"),

              const SizedBox(height: 10),
              // Divider
              Container(
                width: 260,
                height: 1,
                color: Colors.white.withOpacity(0.8),
              ),

              const SizedBox(height: 10),

              _navItem(
                icon: Icons.support_agent_outlined,
                label: "App Policies",
              ),
              _navItem(icon: Icons.info_outline, label: "Help"),
            ],
          ),

          // === LOGOUT (Fixed at bottom) ===
          Container(
            width: 260,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF007083),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.power_settings_new_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Log out",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // === Custom nav item widget ===
  Widget _navItem({required IconData icon, required String label}) {
    return Container(
      width: 260,
      height: 56,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF007083),
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: Colors.white)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.white),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhiteDrawer extends StatelessWidget {
  const WhiteDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF007083)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // === Profile Header ===
              Container(
                width: 260,
                // height: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF007083)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x40007083),
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    // Profile Image
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: const Color(0xFFFAFAFA),
                        image: const DecorationImage(
                          image: AssetImage('assets/img/person-img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Texts
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Smith",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF007083),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "smith123@gmail.com",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xFF007083),
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text(
                          "England",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xFF007083),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Divider Line
              Container(width: 260, height: 1, color: const Color(0xFF007083)),

              const SizedBox(height: 20),

              // === Menu Items ===
              _drawerItem(icon: Icons.home_outlined, label: "Dashboard"),
              _drawerItem(icon: Icons.wallet, label: "Your Wallet"),
              _drawerItem(icon: Icons.call, label: "Call History"),
              _drawerItem(icon: Icons.analytics_outlined, label: "Claims"),
              _drawerItem(
                icon: Icons.notifications_none,
                label: "Notifications",
              ),

              const SizedBox(height: 15),

              Container(width: 260, height: 1, color: const Color(0xFF007083)),

              const SizedBox(height: 15),

              _drawerItem(
                icon: Icons.support_agent_outlined,
                label: "App Policies",
              ),
              _drawerItem(icon: Icons.info_outline, label: "Help"),
            ],
          ),

          // === Logout Button (Fixed Bottom) ===
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 260,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF007083),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x40007083),
                    blurRadius: 4,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Row(
                children: const [
                  SizedBox(width: 16),
                  Icon(Icons.logout, color: Colors.white, size: 22),
                  SizedBox(width: 12),
                  Text(
                    "Log out",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === Drawer Item Template ===
  Widget _drawerItem({required IconData icon, required String label}) {
    return Container(
      width: 260,
      height: 56,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF007083)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40007083),
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(icon, size: 22, color: const Color(0xFF007083)),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xFF007083),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF007083)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Header
              Container(
                width: 260,
                // height: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF99C6CD),
                  border: Border.all(color: const Color(0xFF007083)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/img/person-img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Smith",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xFF007083),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "smith123@gmail.com",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xFF757575),
                          ),
                        ),
                        Text(
                          "England",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xFF757575),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Navigation items section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _navItem(
                        label: "Dashboard",
                        icon: Icons.dashboard,
                        bgColor: const Color(0xFF007083),
                      ),
                      const SizedBox(height: 5),
                      _navItem(
                        label: "Appointments",
                        icon: Icons.calendar_month,
                        bgColor: const Color(0xFF007083),
                      ),
                      const SizedBox(height: 5),
                      _navItem(
                        label: "Sessions",
                        icon: Icons.access_time,
                        bgColor: const Color(0xFF007083),
                      ),
                      const SizedBox(height: 5),
                      _navItem(
                        label: "Messages",
                        icon: Icons.message_outlined,
                        bgColor: const Color(0xFF007083),
                      ),
                      const SizedBox(height: 5),
                      _navItem(
                        label: "Notifications",
                        icon: Icons.notifications_outlined,
                        bgColor: const Color(0xFF007083),
                      ),
                      const SizedBox(height: 5),
                      _navItem(
                        label: "Settings",
                        icon: Icons.settings_outlined,
                        bgColor: const Color(0xFF007083),
                      ),

                      const SizedBox(height: 10),

                      // Divider line
                      Container(
                        width: 260,
                        height: 1,
                        color: const Color(0xFF007083),
                      ),

                      const SizedBox(height: 10),

                      // Section title
                      const Text(
                        "Support",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Color(0xFF007083),
                        ),
                      ),

                      const SizedBox(height: 10),

                      _navItem(
                        label: "Help Center",
                        icon: Icons.help_outline,
                        bgColor: const Color(0xFF007083),
                      ),
                      // const SizedBox(height: 5),
                      // _navItem(
                      //   label: "Feedback",
                      //   icon: Icons.feedback_outlined,
                      //   bgColor: const Color(0xFF007083),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Logout Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _navItem(
              label: "Log Out",
              icon: Icons.logout,
              bgColor: const Color(0xFF007083),
              isLogout: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required String label,
    required IconData icon,
    Color bgColor = Colors.white,
    bool isLogout = false,
  }) {
    return Container(
      width: 260,
      height: 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          if (isLogout)
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
        ],
      ),
    );
  }
}

class CustomNavigationSideBar extends StatelessWidget {
  const CustomNavigationSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 60,
      color: Color(0xff007083),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔹 Top profile card (Nav item 11)
                Container(
                  width: 260,
                  // height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFF99C6CD),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(35),
                          image: const DecorationImage(
                            image: AssetImage('assets/img/person-img.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Smith",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xFF007083),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "smith123@gmail.com",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: Color(0xFF757575),
                            ),
                          ),
                          Text(
                            "England",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Navigation items
                _drawerItem("Dashboard", Icons.dashboard),
                _drawerItem("My Wallet", Icons.wallet),
                _drawerItem('Call history', Icons.call),
                _drawerItem("Notifications", Icons.notifications_rounded),
                _drawerItem("Claims", Icons.analytics),

                const Spacer(),
              ],
            ),

            // 🔹 Logout at bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: 260,
                height: 56,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(Icons.logout, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Log out",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper widget for each navigation item
  Widget _drawerItem(String title, IconData iconPath) {
    return Container(
      width: 260,
      height: 56,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Icon(iconPath, color: Colors.white),
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.white),
              //   image: DecorationImage(
              //     image: AssetImage(iconPath),
              //     fit: BoxFit.contain,
              //   ),
              // ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
