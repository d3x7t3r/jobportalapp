import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobportalapp/pages/accountpage.dart';
import 'package:jobportalapp/pages/homepage.dart';
import 'package:jobportalapp/pages/settings_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
    required int acceptedJobs,
    required int appliedJobs,
    required int rejectedJobs,
    required int pendingJobs,
  }) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    // Get the current user's display name
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      userName = user.displayName;
    }
  }

  int totalJobCount = 0;
  int appliedJobs = 0;
  int acceptedJobs = 0;
  int rejectedJobs = 0;
  int pendingJobs = 0;

  void fetchJobData() {
    // Fetch job data from the home page or any other source
    // Assign the fetched values to the respective variables
    // Example:
    setState(() {
      totalJobCount = 20;
      appliedJobs = 10;
      acceptedJobs = 5;
      rejectedJobs = 2;
      pendingJobs = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Call the fetchJobData method to fetch the data
    fetchJobData();

    // Sample data for the pie chart
    final data = [
      ChartData('Applied', appliedJobs.toDouble()),
      ChartData('Accepted', acceptedJobs.toDouble()),
      ChartData('Rejected', rejectedJobs.toDouble()),
      ChartData('Pending', pendingJobs.toDouble()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 64,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userName ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  DashboardItem(
                    icon: Icons.business,
                    title: 'Jobs Available',
                    count: totalJobCount,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  DashboardItem(
                    icon: Icons.cases_rounded,
                    title: 'Jobs Applied',
                    count: appliedJobs,
                    onTap: () {
                      // Handle Applied Jobs item tap
                    },
                  ),
                  DashboardItem(
                    icon: Icons.check_circle,
                    title: 'Accepted Jobs',
                    count: acceptedJobs,
                    onTap: () {
                      // Handle Accepted Jobs item tap
                    },
                  ),
                  DashboardItem(
                    icon: Icons.cancel,
                    title: 'Rejected Jobs',
                    count: rejectedJobs,
                    onTap: () {
                      // Handle Rejected Jobs item tap
                    },
                  ),
                  DashboardItem(
                    icon: Icons.pending,
                    title: 'Pending Jobs',
                    count: pendingJobs,
                    onTap: () {
                      // Handle Pending Jobs item tap
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: SfCircularChart(
                      series: <CircularSeries<ChartData, String>>[
                        PieSeries<ChartData, String>(
                          dataSource: data,
                          xValueMapper: (ChartData chartData, _) =>
                              chartData.category,
                          yValueMapper: (ChartData chartData, _) =>
                              chartData.value,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                            connectorLineSettings: ConnectorLineSettings(
                              type: ConnectorType.curve,
                            ),
                            labelIntersectAction: LabelIntersectAction.hide,
                            textStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardPage(
                  acceptedJobs: 0,
                  appliedJobs: 0,
                  pendingJobs: 0,
                  rejectedJobs: 0,
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int count;
  final VoidCallback onTap;

  const DashboardItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Text(
              count.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
