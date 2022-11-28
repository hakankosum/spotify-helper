import 'package:ff/providers/categories_provider.dart';
import 'package:ff/providers/new_realese_provider.dart';
import 'package:ff/screens/animations/opening_animation.dart';
import 'package:ff/screens/common/app_bar.dart';
import 'package:ff/services/search_artist_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../models/search_artist_model.dart';
import '../services/category_playlist_service.dart';
import 'common/bottom_nav.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GetNewRealeseProvider? newRealeseSong;
  GetCategoriesProvider? categories;
  SearchArtistModel? searchedArtist;

  @override
  void initState() {
    newRealeseSong = Provider.of<GetNewRealeseProvider>(context, listen: false);
    categories = Provider.of<GetCategoriesProvider>(context, listen: false);
    newRealeseSong!.getNewRealeseSong();
    categories!.getCategories();

    super.initState();
  }

  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, GetNewRealeseProvider value, Widget? child) {
        return Scaffold(
          
          
          body: (newRealeseSong!.isNewSongLoaded == false)
              ? OpeningAnimationWidget()
              : Container(
                  margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
                  height: 100.h,
                  width: 100.w,
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        SearchBar(),
                        
                        const Text(
                          "New Realeses",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Consumer(
                          builder: (BuildContext context,
                              GetNewRealeseProvider value, widget) {
                            return newRealeseSong!.isNewSongLoaded == false
                                ? const Text("")
                                : SizedBox(
                                    height: 30.h,
                                    width: 100.w,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: newRealeseSong!
                                            .new_realese_song!
                                            .albums!
                                            .items!
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.only(right: 5.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 24.h,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        child: Container(
                                                          height: 22.h,
                                                          width: 37.7.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              image: DecorationImage(
                                                                  image: NetworkImage(newRealeseSong!
                                                                      .new_realese_song!
                                                                      .albums!
                                                                      .items![
                                                                          index]
                                                                      .images![
                                                                          0]
                                                                      .url!),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: 19.h,
                                                          right: 2.w,
                                                          child: Container(
                                                              height: 4.h,
                                                              width: 4.h,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade300,
                                                                  shape: BoxShape
                                                                      .circle),
                                                              child: IconButton(
                                                                  onPressed:
                                                                      null,
                                                                  icon: SvgPicture
                                                                      .asset(
                                                                          "assets/ic_miniplay.svg"))))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 3.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        newRealeseSong!
                                                            .new_realese_song!
                                                            .albums!
                                                            .items![index]
                                                            .name!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(height: .5.h),
                                                      Text(
                                                        newRealeseSong!
                                                            .new_realese_song!
                                                            .albums!
                                                            .items![index]
                                                            .artists![0]
                                                            .name!,
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  );
                          },
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Consumer(
                          builder:
                              (context, GetCategoriesProvider value, child) {
                            if (categories!.is_categories_loaded == true) {
                              return SizedBox(
                                height: 22.h *
                                    categories!
                                        .categories!.categories!.items!.length /
                                    2,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  itemCount: categories!
                                      .categories!.categories!.items!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () => CategoryPlaylistsService(
                                          categories!.categories!.categories!
                                              .items![index].id!),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(categories!
                                                    .categories!
                                                    .categories!
                                                    .items![index]
                                                    .icons![0]
                                                    .url!))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 80),
                                          child: Center(
                                              child: Text(
                                            categories!.categories!.categories!
                                                .items![index].name!,
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
