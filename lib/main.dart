import 'package:flutter/material.dart';
import 'package:musicplaylist/PageUI/playListPage.dart';
import 'package:provider/provider.dart';

import 'Provider/musicPlayerProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicPlayerProvider()),
      ],
      child: const MyApp(),
    ),


  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Play List',
      home: PlaylistPage(),
    );
  }
}

