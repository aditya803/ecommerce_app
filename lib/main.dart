
import 'package:ecommerce_app/providers/auth_provider.dart';
import 'package:ecommerce_app/providers/product_provider.dart';
import 'package:ecommerce_app/screens/auth/login_screen.dart';
import 'package:ecommerce_app/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'config/remote_config_service.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyAqFSJFdSP1u99mb2YXNrVcCtwTXsCayks", // paste your api key here
    appId: "1:473267276276:android:442dab631a776815df11a1", //paste your app id here
    messagingSenderId: "473267276276", //paste your messagingSenderId here
    projectId: "ecommerce-app-955d5", //paste your project id here
  ),);

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  final RemoteConfigService remoteConfigService = RemoteConfigService(remoteConfig);
  await remoteConfigService.initialize();

  runApp(MyApp(remoteConfigService: remoteConfigService));
}

class MyApp extends StatelessWidget {
  final RemoteConfigService remoteConfigService;

  MyApp({required this.remoteConfigService});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        home: SignupScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(remoteConfigService: remoteConfigService),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
        },
      ),
    );
  }
}
