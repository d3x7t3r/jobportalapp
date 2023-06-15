// import 'package:flutter/material.dart';
// import 'package:jobportalapp/pages/homepage.dart';
// import 'package:jobportalapp/pages/jobdetailspage.dart';

// class JobListingsPage extends StatefulWidget {
//   const JobListingsPage({Key? key}) : super(key: key);

//   @override
//   JobListingsPageState createState() => JobListingsPageState();
// }

// class JobListingsPageState extends State<JobListingsPage> {
//   final List<dynamic> jobListings = []; // Updated data type to dynamic

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Job Listings'),
//       ),
//       body: ListView.builder(
//         itemCount: jobListings.length,
//         itemBuilder: (context, index) {
//           final jobListing = jobListings[index];
//           return ListTile(
//             title: Text(
//                 jobListing['title']), // Access the title from the API response
//             subtitle: Text(jobListing[
//                 'company']), // Access the company from the API response
//             trailing: IconButton(
//               icon: Icon(
//                 jobListing['isSaved'] ? Icons.bookmark : Icons.bookmark_border,
//               ),
//               onPressed: () {
//                 setState(() {
//                   jobListing['isSaved'] = !jobListing['isSaved'];
//                 });
//               },
//             ),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => JobDetailsPage(job: jobListing),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
