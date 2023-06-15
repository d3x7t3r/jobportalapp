// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import '../models/job.dart';

// class JobApplication extends Job {
//   final String candidateName;
//   final String jobTitle;
//   final String applicationDate;
//   final String status;

//   JobApplication({
//     required this.candidateName,
//     required this.jobTitle,
//     required this.applicationDate,
//     required this.status,
//     required super.title,
//     required super.description,
//     required super.company,
//     required super.qualifications,
//     required super.deadline,
//     required super.category,
//     required super.contact,
//   }) : super(id: '', title: '', company: '', location: '');
// }

// class ReportPage extends StatelessWidget {
//   final List<JobApplication> applications;

//   const ReportPage({Key? key, required this.applications}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Job Applications Report'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Candidate Name')),
//                   DataColumn(label: Text('Job Title')),
//                   DataColumn(label: Text('Application Date')),
//                   DataColumn(label: Text('Employer')),
//                   DataColumn(label: Text('Location')),
//                   DataColumn(label: Text('Status')),
//                 ],
//                 rows: applications.map((application) {
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(application.candidateName)),
//                       DataCell(Text(application.jobTitle)),
//                       DataCell(Text(application.applicationDate)),
//                       DataCell(Text(application.company)),
//                       DataCell(Text(application.location)),
//                       DataCell(Text(application.status)),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 downloadReport(context, applications); // Pass the context
//               },
//               child: const Text('Download Report'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void downloadReport(
//       BuildContext context, List<JobApplication> applications) async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.ListView.builder(
//             itemCount: applications.length,
//             itemBuilder: (context, index) {
//               final application = applications[index];
//               return pw.Container(
//                 margin: const pw.EdgeInsets.symmetric(vertical: 8),
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'Candidate Name: ${application.candidateName}',
//                       style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                     ),
//                     pw.Text('Job Title: ${application.jobTitle}'),
//                     pw.Text('Application Date: ${application.applicationDate}'),
//                     pw.Text('Employer: ${application.company}'),
//                     pw.Text('Location: ${application.location}'),
//                     pw.Text('Status: ${application.status}'),
//                     pw.Divider(),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );

//     final bytes = await pdf.save();
//     await savePDF(bytes);
//     showSaveDialog(context); // Pass the context
//   }

//   void showSaveDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('PDF Saved'),
//           content:
//               const Text('The job report PDF has been saved successfully.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> savePDF(List<int> bytes) async {
//     final appDir = await getApplicationDocumentsDirectory();
//     final appDirPath = appDir.path;

//     final timestamp = DateTime.now().millisecondsSinceEpoch;
//     final fileName = 'job_report_$timestamp.pdf';
//     final filePath = '$appDirPath/$fileName';

//     final file = File(filePath);
//     await file.writeAsBytes(bytes);
//   }
// }
