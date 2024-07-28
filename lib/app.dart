// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'providers/auth_provider.dart';
// import 'screens/auth/login_screen.dart';
// import 'screens/home/home_screen.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//       ],
//       child: MaterialApp(
//         title: 'E-Commerce App',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: LoginScreen(),
//         routes: {
//           HomeScreen.routeName: (ctx) => HomeScreen(),
//         },
//       ),
//     );
//   }
// }
