// import 'package:flutter/material.dart';
// import 'package:jobportalapp/pages/homepage.dart';
// import 'package:jobportalapp/pages/jobdetailspage.dart';

// class JobCard extends StatelessWidget {
//   final HomePageJob job;
//   final VoidCallback onTap;

//   const JobCard({
//     Key? key,
//     required this.job,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => JobDetailsPage(job: job),
//             ),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 job.title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 job.company,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(Icons.location_on, size: 16),
//                   const SizedBox(width: 4),
//                   Text(
//                     job.location,
//                     style: const TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(Icons.money, size: 16),
//                   const SizedBox(width: 4),
//                   Text(
//                     '${job.salary.toString()} Tsh',
//                     style: const TextStyle(
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: onTap,
//                   child: const Text(
//                     'View Details',
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
