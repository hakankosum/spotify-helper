import 'package:ff/providers/categories_provider.dart';
import 'package:ff/providers/new_realese_provider.dart';
import 'package:ff/providers/profile_detail_provider.dart';
import 'package:ff/providers/profile_playlists_provider.dart';
import 'package:ff/providers/top_tracks_provider.dart';
import 'package:ff/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetNewRealeseProvider()),
        ChangeNotifierProvider(create: (context) => GetCategoriesProvider()),
        ChangeNotifierProvider(create: (context) => TopTracksProvider()),
        ChangeNotifierProvider(create: (context) => ProfilePlaylistsProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileDetailProvider(),)
      ],
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return const MaterialApp(
          title: 'Material App',
          home:  HomeView(),
        );
      },
    );
  }
}
