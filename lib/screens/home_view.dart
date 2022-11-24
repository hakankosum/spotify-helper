import 'package:ff/providers/categories_provider.dart';
import 'package:ff/providers/new_realese_provider.dart';
import 'package:ff/screens/searched_item.dart';
import 'package:ff/services/get_top_tracks.dart';

import 'package:ff/services/search_artist_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/search_artist_model.dart';
import '../services/category_playlist_service.dart';

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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 20,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Container(
                height: 4.h,
                width: 100.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: mycontroller,
                  decoration: InputDecoration(
                    hintText: "Search artist or track",
                    border: InputBorder.none,
                    prefixIconColor: Colors.black,
                    prefixIcon: InkWell(
                        onTap: () async {
                          if (mycontroller.text.isNotEmpty) {
                            searchedArtist =
                                await SearchArtistService(mycontroller.text);
                            if (searchedArtist!.artists!.limit! > 0) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.white,
                                      duration: Duration(seconds: 120),
                                      content: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Icon(Icons.line_weight),
                                          Container(
                                            height: searchedArtist!
                                                    .artists!.limit! *
                                                9.h,
                                            child: ListView.builder(
                                              itemCount: searchedArtist!
                                                  .artists!.limit!,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  print(searchedArtist!.artists!
                                                      .items![index].id!);
                                                },
                                                child: SearchedItem(
                                                    id: searchedArtist!.artists!
                                                        .items![index].id!,
                                                    artistName: searchedArtist!
                                                        .artists!
                                                        .items![index]
                                                        .name!,
                                                    imageUri: searchedArtist!
                                                            .artists!
                                                            .items![index]
                                                            .images!
                                                            .isNotEmpty
                                                        ? searchedArtist!
                                                            .artists!
                                                            .items![index]
                                                            .images![0]
                                                            .url!
                                                        : "https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png?20091205084734",
                                                    totalFollower:
                                                        searchedArtist!
                                                            .artists!
                                                            .items![index]
                                                            .followers!
                                                            .total!),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )));
                            }
                          } else {
                            print("boş text aratıyorsun!");
                          }
                          ;
                        },
                        child: const Icon(
                          Icons.search,
                          size: 24,
                        )),
                  ),
                ),
              ),
              const Text(
                "New Realese",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Consumer(
                builder: (BuildContext context, GetNewRealeseProvider value,
                    widget) {
                  return newRealeseSong!.is_new_realese_song_loaded == false
                      ? const CircularProgressIndicator()
                      : Container(
                          height: 20.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(newRealeseSong!
                                      .new_realese_song!
                                      .albums!
                                      .items![0]
                                      .images![0]
                                      .url!),
                                  fit: BoxFit.fill)),
                        );
                },
              ),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Consumer(
                builder: (context, GetCategoriesProvider value, child) {
                  if (categories!.is_categories_loaded == true) {
                    return SizedBox(
                      height: 22.h *
                          categories!.categories!.categories!.items!.length /
                          2,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount:
                            categories!.categories!.categories!.items!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => CategoryPlaylistsService(categories!
                                .categories!.categories!.items![index].id!),
                            child: Container(
                              margin: EdgeInsets.all(1.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(categories!
                                          .categories!
                                          .categories!
                                          .items![index]
                                          .icons![0]
                                          .url!))),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 80),
                                child: Center(
                                    child: Text(
                                  categories!.categories!.categories!
                                      .items![index].name!,
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      height: 10.h,
                      width: 10.h,
                      color: Colors.yellow,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
