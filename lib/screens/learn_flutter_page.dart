// import 'package:flutter/material.dart';

// class LearnFlutterPage extends StatefulWidget {
//   const LearnFlutterPage({super.key});

//   @override
//   State<LearnFlutterPage> createState() => _LearnFlutterPageState();
// }

// class _LearnFlutterPageState extends State<LearnFlutterPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [_buildCard()]),
//       alignment: Alignment.center,
//       padding: const EdgeInsets.all(32),
//       decoration: const BoxDecoration(
//           image: DecorationImage(
//         image: NetworkImage(
//             'https://i.pinimg.com/originals/2b/a3/ab/2ba3ab0eb7ebc7ed5ab14f60f504c2ce.gif'),
//         fit: BoxFit.cover,
//       )),
//     );
//   }
// }

// Widget _buildCard() {
//   return SizedBox(
//     height: 210,
//     child: Card(
//       margin: const EdgeInsets.all(30),
//       child: Column(
//         children: [
//           ListTile(
//             title: const Text(
//               '1625 Main Street',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             subtitle: const Text('My City, CA 99984'),
//             leading: Icon(
//               Icons.restaurant_menu,
//               color: Colors.blue[500],
//             ),
//           ),
//           const Divider(),
//           ListTile(
//             title: const Text(
//               '(408) 555-1212',
//               style: TextStyle(fontWeight: FontWeight.w500),
//             ),
//             leading: Icon(
//               Icons.contact_phone,
//               color: Colors.blue[500],
//             ),
//           ),
//           ListTile(
//             title: const Text('costa@example.com'),
//             leading: Icon(
//               Icons.contact_mail,
//               color: Colors.blue[500],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
