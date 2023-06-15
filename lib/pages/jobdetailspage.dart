// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:jobportalapp/pages/homepage.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:logger/logger.dart';

// class JobDetailsPage extends StatelessWidget {
//   JobDetailsPage(
//       {Key? key,
//       required this.job,
//       this.name,
//       this.email,
//       this.phoneNumber,
//       this.address,
//       this.documents})
//       : super(key: key);
//   final HomePageJob job;

//   final Completer<GoogleMapController> _mapController =
//       Completer<GoogleMapController>();

//   late final String? name;
//   late final String? email;
//   late final String? phoneNumber;
//   late final String? address;
//   late final List<PlatformFile>? documents;

//   Set<Marker> _createMarkers() {
//     return <Marker>{
//       Marker(
//         markerId: const MarkerId('job_location'),
//         position: LatLng(job.latitude, job.longitude),
//         infoWindow: InfoWindow(title: job.location),
//       ),
//     };
//   }

//   Future<void> _goToJobLocation() async {
//     final GoogleMapController controller = await _mapController.future;
//     controller.animateCamera(
//         CameraUpdate.newLatLngZoom(LatLng(job.latitude, job.longitude), 15));
//   }

//   void _applyForJob(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text(
//           'Apply',
//           textAlign: TextAlign.center,
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//               ),
//               onChanged: (value) {
//                 name = value;
//               },
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//               onChanged: (value) {
//                 email = value;
//               },
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//               ),
//               onChanged: (value) {
//                 phoneNumber = value;
//               },
//             ),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'address',
//               ),
//               onChanged: (value) {
//                 address = value;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 FilePickerResult? result = await FilePicker.platform.pickFiles(
//                   allowMultiple: true,
//                 );

//                 if (result != null) {
//                   documents = result.files;
//                 }
//               },
//               child: const Text('Upload Documents'),
//             ),
//           ],
//         ),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 1,
//                 child: TextButton(
//                   onPressed: () {
//                     _submitApplication();
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Flexible(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Close'),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   final logger = Logger();
//   void _submitApplication() {
//     // Perform the application submission logic
//     // Access the entered information and uploaded documents from the variables
//     // (e.g., name, email, phoneNumber, documents) and process them accordingly
//     // You can send the data to a server, save it locally, or perform any other necessary actions
//     // For now, you can print the values for testing purposes
//     logger.d('Name: $name');
//     logger.d('Email: $email');
//     logger.d('Phone Number: $phoneNumber');
//     logger.d('address: $address');
//     logger.d('Documents:');
//     if (documents != null) {
//       for (var document in documents!) {
//         logger.d('  - ${document.name}');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(job.title),
//         backgroundColor: Colors.blueAccent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blueAccent, Colors.blue],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               final String shareText =
//                   'Check out this job: ${job.title}\n\nCompany: ${job.company}\n\nDescription: ${job.description}';

//               Share.share(shareText);
//             },
//             icon: const Icon(Icons.share),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               job.company,
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Category: ${job.category}',
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 16),
//             SingleChildScrollView(
//               child: Text(
//                 job.description,
//                 style: const TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Qualifications:',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               job.qualifications,
//               style: const TextStyle(fontSize: 14),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Deadline:',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               job.deadline,
//               style: const TextStyle(fontSize: 14),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 200,
//               child: GoogleMap(
//                 onMapCreated: (controller) {
//                   _mapController.complete(controller);
//                 },
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(job.latitude, job.longitude),
//                   zoom: 10,
//                 ),
//                 markers: _createMarkers(),
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: _goToJobLocation,
//               child: const Text('Go to Job Location'),
//             ),
//             const SizedBox(height: 8),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () {
//                 _applyForJob(context);
//               },
//               child: const Text('Apply for The Job'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
