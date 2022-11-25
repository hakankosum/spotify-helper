import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class OpeningAnimationWidget extends StatefulWidget {
  const OpeningAnimationWidget({super.key});

  @override
  State<OpeningAnimationWidget> createState() => _OpeningAnimationWidgetState();
}

class _OpeningAnimationWidgetState extends State<OpeningAnimationWidget> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =AnimationController(duration: Duration(milliseconds: 1000),vsync: this );
    animation = Tween<double>(begin: 0,end: 1).animate(animationController!)..addListener(() {
      setState(() {
        
      });
    })..addStatusListener((status) { 
      if (status==AnimationStatus.completed){
        animationController!.reverse();
      }
      else if (status == AnimationStatus.dismissed){
        animationController!.forward();
      }
    });
    animationController!.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        alignment: Alignment.center,
        scale: animationController!.value,
        child: Container(
          height: 60,
          width: 190,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Vector.png"))),
        ),
      ),
    );
  }
}
