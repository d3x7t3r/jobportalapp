import 'package:flutter/material.dart';
import 'package:jobportalapp/pages/accountpage.dart';
import 'package:jobportalapp/pages/dashboardpage.dart';
import 'package:jobportalapp/pages/settings_page.dart';

class Job {
  final String title;
  final String company;
  final String location;
  final String category;
  final String description;

  Job({
    required this.title,
    required this.company,
    required this.location,
    required this.category,
    required this.description,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Job> jobs = [
    Job(
      title: 'Software Engineer',
      company: 'Example Company',
      location: 'Dodoma',
      category: 'Technology',
      description:
          'We are looking for a skilled software engineer to join our team.',
    ),
    Job(
      title: 'Product Manager',
      company: 'Another Company',
      location: 'Mwanza',
      category: 'Management',
      description:
          'We are seeking an experienced product manager to lead our product development efforts.',
    ),
    Job(
      title: 'Marketing Specialist',
      company: 'Marketing Agency',
      location: 'Chato',
      category: 'Marketing',
      description:
          'We are hiring a marketing specialist to develop and execute marketing campaigns.',
    ),
    Job(
      title: 'Data Analyst',
      company: 'Data Solutions',
      location: 'Dodoma',
      category: 'Data Science',
      description:
          'Join our data team and help analyze and interpret large datasets.',
    ),
    Job(
      title: 'Graphic Designer',
      company: 'Design Studio',
      location: 'Dar es Salaam',
      category: 'Design',
      description:
          'We are seeking a creative graphic designer to join our team.',
    ),
    Job(
      title: 'Financial Analyst',
      company: 'Finance Corporation',
      location: 'Mtwara',
      category: 'Finance',
      description:
          'We are hiring a financial analyst to provide financial planning and analysis.',
    ),
    Job(
      title: 'Sales Representative',
      company: 'Sales Company',
      location: 'Lindi',
      category: 'Sales',
      description:
          'Join our sales team and help us drive revenue and expand our customer base.',
    ),
    // Add more job listings here...
    Job(
      title: 'Content Writer',
      company: 'Content Agency',
      location: 'Mwanza',
      category: 'Writing',
      description:
          'We are seeking a skilled content writer to create engaging and persuasive content.',
    ),
    Job(
      title: 'HR Manager',
      company: 'HR Solutions',
      location: 'Moshi',
      category: 'Human Resources',
      description:
          'Join our HR team and oversee all aspects of human resources management.',
    ),
    Job(
      title: 'Web Developer',
      company: 'Web Solutions',
      location: 'Dar es Salaam',
      category: 'Technology',
      description:
          'We are hiring a web developer to build and maintain websites and web applications.',
    ),
    Job(
      title: 'Operations Manager',
      company: 'Operations Company',
      location: 'Dodoma',
      category: 'Management',
      description:
          'Join our operations team and ensure smooth and efficient business operations.',
    ),
    Job(
      title: 'UI/UX Designer',
      company: 'Design Studio',
      location: 'Arusha',
      category: 'Design',
      description:
          'We are seeking a talented UI/UX designer to create intuitive and visually appealing user interfaces.',
    ),
    Job(
      title: 'Digital Marketing Specialist',
      company: 'Marketing Agency',
      location: 'Morogoro',
      category: 'Marketing',
      description:
          'We are hiring a digital marketing specialist to drive online marketing strategies.',
    ),
    Job(
      title: 'Data Scientist',
      company: 'Data Solutions',
      location: 'Dar es Salaam',
      category: 'Data Science',
      description:
          'Join our data science team and apply advanced analytics to solve complex problems.',
    ),
    Job(
      title: 'Accountant',
      company: 'Accounting Firm',
      location: 'Tanga',
      category: 'Finance',
      description:
          'We are seeking an experienced accountant to manage financial records and transactions.',
    ),
    Job(
      title: 'Customer Support Representative',
      company: 'Customer Support Company',
      location: 'Dar es Salaam',
      category: 'Customer Service',
      description:
          'Join our customer support team and provide assistance to our customers.',
    ),
    Job(
      title: 'Copywriter',
      company: 'Copywriting Agency',
      location: 'Dar es Salaam',
      category: 'Writing',
      description:
          'We are seeking a skilled copywriter to create persuasive and compelling copy.',
    ),
  ];

  List<Job> filteredJobs = [];

  @override
  void initState() {
    super.initState();
    filteredJobs = List.from(jobs);
  }

  void filterJobs(String keyword) {
    setState(() {
      filteredJobs = jobs.where((job) {
        final titleMatches =
            job.title.toLowerCase().contains(keyword.toLowerCase());
        final categoryMatches =
            job.category.toLowerCase().contains(keyword.toLowerCase());
        final companyMatches =
            job.company.toLowerCase().contains(keyword.toLowerCase());
        return titleMatches || categoryMatches || companyMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Portal'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Job Categories',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('All Jobs'),
              onTap: () {
                setState(() {
                  filteredJobs = List.from(jobs);
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.computer),
              title: const Text('Technology'),
              onTap: () {
                setState(() {
                  filteredJobs = jobs
                      .where((job) => job.category == 'Technology')
                      .toList();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Management'),
              onTap: () {
                setState(() {
                  filteredJobs = jobs
                      .where((job) => job.category == 'Management')
                      .toList();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Marketing'),
              onTap: () {
                setState(() {
                  filteredJobs =
                      jobs.where((job) => job.category == 'Marketing').toList();
                });
                Navigator.pop(context);
              },
            ),
            // Add more category options here...
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterJobs,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredJobs.length,
              itemBuilder: (ctx, index) {
                final job = filteredJobs[index];
                return JobCard(job: job);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
        items: const [
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

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({Key? key, required this.job}) : super(key: key);

  void applyForJob(BuildContext context) {
    // Implement the logic to handle the job application here
    // You can show a dialog, navigate to a new page, or perform any other action
    // when the user taps the "Apply" button for a specific job.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Job Application'),
          content: const Text('Your job application has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  job.company,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(job.location),
                const SizedBox(height: 8),
                Text(job.category),
                const SizedBox(height: 16),
                Text(job.description),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                applyForJob(context);
              },
              child: const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
