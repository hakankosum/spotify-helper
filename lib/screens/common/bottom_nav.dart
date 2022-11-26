import 'package:ff/screens/home_view.dart';
import 'package:ff/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class myBottomNav extends StatelessWidget {
  const myBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                height: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed:() {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                        },
                        icon: SvgPicture.asset("assets/ic_home.svg")),
                    IconButton(
                        onPressed: null,
                        icon: SvgPicture.asset("assets/ic_discovery.svg")),
                    IconButton(
                        onPressed: null,
                        icon: SvgPicture.asset("assets/ic_fav.svg")),
                    IconButton(
                        onPressed:() {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
                        },
                        icon: SvgPicture.asset("assets/ic_profile.svg")),
                  ],
                ),
              );
  }
}