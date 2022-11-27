import 'package:ff/providers/bottom_nav_provider.dart';
import 'package:ff/screens/home_view.dart';
import 'package:ff/screens/profile_view.dart';
import 'package:ff/screens/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class myBottomNav extends StatelessWidget {
  const myBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Consumer(
        builder:
            (BuildContext context, BottomNavProvider value, Widget? child) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      value.paintSelectedIcon(0);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    },
                    icon: SvgPicture.asset(
                      "assets/ic_home.svg",
                      color: value.colors[0],
                    )),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      value.paintSelectedIcon(1);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SearchView()));
                    },
                    icon: SvgPicture.asset(
                      "assets/ic_discovery.svg",
                      color: value.colors[1],
                    )),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      value.paintSelectedIcon(2);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    },
                    icon: SvgPicture.asset(
                      "assets/ic_fav.svg",
                      color: value.colors[2],
                    )),
                IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      value.paintSelectedIcon(3);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView()));
                    },
                    icon: SvgPicture.asset(
                      "assets/ic_profile.svg",
                      color: value.colors[3],
                    ))
              ]);
        },
      ),
    );
  }
}
