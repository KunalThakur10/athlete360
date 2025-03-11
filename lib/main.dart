import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true; // Dark mode toggle state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
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

class AdminDashboard extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;

  AdminDashboard({required this.isDarkMode, required this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar - Admin Tools
          Container(
            width: 250,
            color: isDarkMode ? Colors.black87 : Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin Tools",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                _buildSidebarButton("Practice Sessions"),
                _buildSidebarButton("Player Diets"),
                _buildSidebarButton("Latest Injury Reports"),
                _buildSidebarButton("Performance Tracking"),
                _buildSidebarButton("Match Analytics"),
                _buildSidebarButton("Training Plans"),
                _buildSidebarButton("Notifications"),
                _buildSidebarButton("Settings"),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Top Bar
                Container(
                  padding: EdgeInsets.all(16),
                  color: isDarkMode ? Colors.black : Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome Coach! Ready to analyze players?",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            onPressed: toggleDarkMode,
                          ),
                          SizedBox(width: 10),
                          // Coach Profile
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/no_user.png'),
                                radius: 20,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Coach",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "coach@email.com",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isDarkMode ? Colors.grey : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Player Grid
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Smaller grid
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 11,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[900] : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: isDarkMode ? Colors.black54 : Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/no_user.png'),
                                radius: 30,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "PLAYER ${index + 1}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar Buttons
  Widget _buildSidebarButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
