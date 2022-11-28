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

class myBottomNav extends StatefulWidget {
  myBottomNav({super.key});

  @override
  State<myBottomNav> createState() => _myBottomNavState();
}

class _myBottomNavState extends State<myBottomNav> {
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 90.w,
      child: Consumer(
        builder:
            (BuildContext context, BottomNavProvider value, Widget? child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
              
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: SizedBox(
                    
                    height: 5.h,
                    width: 5.h,
                    child: IconButton(
                        onPressed: () {
                          value.paintSelectedIcon(0);
                          value.isSelected = 0;
                        },
                        icon: SvgPicture.asset(
                          "assets/ic_home.svg",
                          color: value.colors[0],
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  
                  label: "",
                  icon: SizedBox(
                    
                    height: 5.h,
                    width: 5.h,
                    child: IconButton(
                        onPressed: () {
                          value.paintSelectedIcon(1);
                          value.isSelected = 1;
                        },
                        icon: SvgPicture.asset(
                          "assets/ic_discovery.svg",
                          color: value.colors[1],
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: SizedBox(
                    
                    height: 5.h,
                    width: 5.h,
                    child: IconButton(
                        onPressed: () {
                          value.paintSelectedIcon(2);
                          value.isSelected = 2;
                        },
                        icon: SvgPicture.asset(
                          "assets/ic_fav.svg",
                          color: value.colors[2],
                        )),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: SizedBox(
                    
                    height: 5.h,
                    width: 5.h,
                    child: IconButton(
                        onPressed: () {
                          value.paintSelectedIcon(3);
                          value.isSelected = 3;
                        },
                        icon: SvgPicture.asset(
                          "assets/ic_profile.svg",
                          color: value.colors[3],
                        )),
                  ),
                )
              ]);
        },
      ),
    );
  }
}
