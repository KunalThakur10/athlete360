import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coach Admin Dashboard',
      theme: isDarkMode
          ? ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF64B5F6),
          secondary: Color(0xFF81C784),
          surface: Color(0xFF212121),
          background: Color(0xFF121212),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF1E1E1E),
        ),
      )
          : ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1976D2),
          secondary: Color(0xFF4CAF50),
          surface: Colors.white,
          background: Color(0xFFF5F5F5),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      home: AdminDashboard(
        isDarkMode: isDarkMode,
        toggleDarkMode: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;

  const AdminDashboard({
    Key? key,
    required this.isDarkMode,
    required this.toggleDarkMode,
  }) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  // List of page titles
  final List<String> _pageTitles = [
    "Dashboard",
    "Practice Sessions",
    "Player Diets",
    "Injury Reports",
    "Performance Tracking",
    "Match Analytics",
    "Training Plans",
    "Notifications",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          NavigationRail(
            extended: true,
            minExtendedWidth: 220,
            backgroundColor: widget.isDarkMode ? const Color(0xFF1A1A1A) : const Color(0xFFF0F0F0),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.sports_soccer,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Admin Tools",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
            ),
            destinations: [
              _buildNavRailDestination(Icons.dashboard, "Dashboard"),
              _buildNavRailDestination(Icons.schedule, "Practice Sessions"),
              _buildNavRailDestination(Icons.restaurant_menu, "Player Diets"),
              _buildNavRailDestination(Icons.healing, "Injury Reports"),
              _buildNavRailDestination(Icons.trending_up, "Performance"),
              _buildNavRailDestination(Icons.analytics, "Match Analytics"),
              _buildNavRailDestination(Icons.fitness_center, "Training Plans"),
              _buildNavRailDestination(Icons.notifications, "Notifications"),
              _buildNavRailDestination(Icons.settings, "Settings"),
            ],
          ),

          // Vertical divider
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: widget.isDarkMode ? Colors.grey[800] : Colors.grey[300],
          ),

          // Main content area
          Expanded(
            child: Column(
              children: [
                // App bar
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: theme.appBarTheme.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _pageTitles[_selectedIndex],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Row(
                        children: [
                          // Dark mode toggle
                          IconButton(
                            icon: Icon(
                              widget.isDarkMode ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                              color: theme.colorScheme.onSurface,
                            ),
                            onPressed: widget.toggleDarkMode,
                            tooltip: widget.isDarkMode ? "Light Mode" : "Dark Mode",
                          ),
                          const SizedBox(width: 16),
                          // Profile
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                                child: Icon(
                                  Icons.person,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Coach Smith",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  Text(
                                    "coach@teamapp.com",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_drop_down,
                                color: theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Page content
                Expanded(
                  child: _buildPageContent(_selectedIndex, theme),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination _buildNavRailDestination(IconData icon, String label) {
    return NavigationRailDestination(
      icon: Icon(icon),
      selectedIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
      label: Text(
        label,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buildPageContent(int index, ThemeData theme) {
    // These are placeholder widgets for each tab content
    // In a real app, you would likely use separate widget classes for each page

    switch(index) {
      case 0: // Dashboard
        return _buildDashboardPage(theme);
      case 1: // Practice Sessions
        return _buildContentPage("Practice Sessions", Icons.schedule, theme);
      case 2: // Player Diets
        return _buildContentPage("Player Diets", Icons.restaurant_menu, theme);
      case 3: // Injury Reports
        return _buildContentPage("Injury Reports", Icons.healing, theme);
      case 4: // Performance Tracking
        return _buildContentPage("Performance Tracking", Icons.trending_up, theme);
      case 5: // Match Analytics
        return _buildContentPage("Match Analytics", Icons.analytics, theme);
      case 6: // Training Plans
        return _buildContentPage("Training Plans", Icons.fitness_center, theme);
      case 7: // Notifications
        return _buildContentPage("Notifications", Icons.notifications, theme);
      case 8: // Settings
        return _buildContentPage("Settings", Icons.settings, theme);
      default:
        return _buildDashboardPage(theme);
    }
  }

  Widget _buildDashboardPage(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats summary
          Row(
            children: [
              _buildStatCard(
                "Total Players",
                "24",
                Icons.people,
                Colors.blue,
                theme,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                "Training Sessions",
                "12",
                Icons.calendar_today,
                Colors.green,
                theme,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                "Active Injuries",
                "3",
                Icons.medical_services,
                Colors.orange,
                theme,
              ),
              const SizedBox(width: 16),
              _buildStatCard(
                "Games This Week",
                "2",
                Icons.sports_soccer,
                Colors.purple,
                theme,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Players grid
          Text(
            "Team Players",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return _buildPlayerCard(index, theme);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color, ThemeData theme) {
    return Expanded(
      child: Card(
        elevation: 0,
        color: widget.isDarkMode ? const Color(0xFF242424) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard(int index, ThemeData theme) {
    final List<String> positions = ["GK", "DEF", "MID", "FWD"];
    final position = positions[index % positions.length];
    final playerNumber = index + 1;

    return Card(
      elevation: 0,
      color: widget.isDarkMode ? const Color(0xFF242424) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "$playerNumber",
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    position,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Player $playerNumber",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              position == "GK" ? "Goalkeeper" :
              position == "DEF" ? "Defender" :
              position == "MID" ? "Midfielder" : "Forward",
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.zero,
              ),
              child: const Text("Profile", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentPage(String title, IconData icon, ThemeData theme) {
    // Placeholder for other tab content
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: theme.colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "This feature is coming soon",
            style: TextStyle(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text("Get Started"),
          ),
        ],
      ),
    );
  }
}
