import 'package:ff/providers/profile_detail_provider.dart';
import 'package:ff/providers/profile_playlists_provider.dart';
import 'package:ff/screens/common/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileDetailProvider? detail;
  ProfilePlaylistsProvider? playlist;

  @override
  void initState() {
    detail = Provider.of<ProfileDetailProvider>(context, listen: false);
    playlist = Provider.of<ProfilePlaylistsProvider>(context, listen: false);
    detail!.getProfileDetailData();
    playlist!.getProfileData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBottomNav(),
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Consumer(
        builder: (BuildContext context, ProfilePlaylistsProvider value,
            Widget? child) {
          return detail!.isLoaded == true
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.h,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.h),
                                bottomRight: Radius.circular(8.h)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                IconButton(icon:
                                  const Icon(Icons.arrow_back_ios_new_sharp),
                                  onPressed: () => Navigator.pop(context)
                                  
                                ),
                                const Spacer(),
                                const Text(
                                  "Profile",
                                  style: TextStyle(fontSize: 23),
                                ),
                                const Spacer(),
                                Container(
                                    height: 3.h,
                                    width: 3.h,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.more_vert,
                                      size: 20,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Consumer(
                              //profile detail consumer
                              builder: (BuildContext context,
                                  ProfileDetailProvider value, Widget? child) {
                                return value.isLoaded
                                    ? Column(
                                        children: [
                                          Container(
                                            height: 10.h,
                                            width: 10.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(value
                                                        .data!
                                                        .images![0]
                                                        .url!))),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            value.data!.displayName!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 2.h),
                                          Text(
                                            value.data!.followers!.total
                                                .toString(),
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 1.h),
                                          const Text(
                                            "Followers",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14),
                                          )
                                        ],
                                      )
                                    : const CircularProgressIndicator();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(top: 3.h, right: 5.w, left: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "PUBLIC PLAYLISTS",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: playlist!.profileData!.items!.length*10.h+30,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      playlist!.profileData!.items!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 2.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 90,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          playlist!
                                                              .profileData!
                                                              .items![index]
                                                              .images![0]
                                                              .url!)))),
                                          SizedBox(width: 5.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                playlist!.profileData!
                                                    .items![index].name!,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(height: 1.h,),
                                              Text(
                                                "${playlist!.profileData!
                                                    .items![index].tracks!.total} tracks",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          Spacer(),
                                          const Icon(Icons.more_horiz,color: Colors.grey,),
                                          SizedBox(width: 5.w),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          )),

                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
