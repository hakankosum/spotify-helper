import 'package:ff/providers/bottom_nav_provider.dart';
import 'package:ff/providers/categories_provider.dart';
import 'package:ff/providers/new_realese_provider.dart';
import 'package:ff/providers/profile_detail_provider.dart';
import 'package:ff/providers/profile_playlists_provider.dart';
import 'package:ff/providers/search_artist_provider.dart';
import 'package:ff/providers/top_tracks_provider.dart';
import 'package:ff/screens/common/bottom_nav.dart';
import 'package:ff/screens/home_view.dart';
import 'package:ff/screens/profile_view.dart';
import 'package:ff/screens/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetNewRealeseProvider()),
        ChangeNotifierProvider(create: (context) => GetCategoriesProvider()),
        ChangeNotifierProvider(create: (context) => TopTracksProvider()),
        ChangeNotifierProvider(create: (context) => ProfilePlaylistsProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileDetailProvider(),),
        ChangeNotifierProvider(create: (context) => BottomNavProvider(),),
        ChangeNotifierProvider(create: (context) => SearchArtistProvider(),)

      ],
      child: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List screens=[HomeView(),SearchView(),HomeView(),ProfileView()];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,BottomNavProvider value, Widget? child) { return ResponsiveSizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return  MaterialApp(
            title: 'Material App',
            home:  Scaffold(body: screens[value.isSelected],
            bottomNavigationBar: myBottomNav(),
            ),
          );
        },
      ); },
       
    );
  }
}
