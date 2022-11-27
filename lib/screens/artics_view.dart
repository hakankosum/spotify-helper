import 'package:ff/providers/top_tracks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticsPageView extends StatefulWidget {
  final String id;

  const ArticsPageView({super.key, required this.id});

  @override
  State<ArticsPageView> createState() => _ArticsPageViewState();
}

class _ArticsPageViewState extends State<ArticsPageView> {
  TopTracksProvider? topTracks;

  @override
  void initState() {
    topTracks = Provider.of<TopTracksProvider>(context, listen: false);
    topTracks!.GetTopTracks(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(builder:
                (BuildContext context, TopTracksProvider value, Widget? child) {
              if (topTracks!.isLoaded == true) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight: Radius.circular(70)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(topTracks!
                                  .data!.tracks![0].album!.images![0].url!))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Center(
                              child: Text(
                            topTracks!
                                .data!.tracks![0].album!.artists![0].name!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(height: 1.h),
                          Center(
                              child: Text(topTracks!.totalTrack.toString() +
                                  " Tracks")),
                          SizedBox(height: 3.h),
                          Text("Songs",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            
                            
                            
                            itemCount: topTracks!.data!.tracks!.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                
                                height: 10.h,
                                width: 5.h,
                                child: Row(
                                  children: [
                                    Icon(Icons.play_circle,
                                        color: Colors.green, size: 5.h),
                                    SizedBox(width: 4.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: 50.w,
                                            child: Text(
                                                topTracks!
                                                    .data!
                                                    .tracks![index]
                                                    .album!
                                                    .name!,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        SizedBox(height: 1.h),
                                        SizedBox(
                                            width: 50.w,
                                            child: Text(
                                                topTracks!
                                                    .data!
                                                    .tracks![index]
                                                    .artists![0]
                                                    .name!,
                                                style:
                                                    TextStyle(fontSize: 12))),
                                      ],
                                    ),
                                    Text(topTracks!.duration[index]),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            })
          ],
        ),
      ),
    );
  }
}
