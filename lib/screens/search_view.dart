import 'package:ff/screens/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/search_artist_model.dart';
import '../providers/search_artist_provider.dart';
import 'common/bottom_nav.dart';
import 'common/searched_item.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
@override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Container(
          margin: EdgeInsets.only(left: 5.w,right: 5.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              SearchBar(),
              Consumer(
                builder: (BuildContext context, SearchArtistProvider value,
                    Widget? child) {
                  return value.isLoaded
                      ? Column(
                        children: [
                          

                          SizedBox(
                              height: value.searchArtist!.artists!.limit! * 10.h,
                              child: ListView.builder(
                                itemCount: value.searchArtist!.artists!.limit!,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    print(value
                                        .searchArtist!.artists!.items![index].id!);
                                  },
                                  child: SearchedItem(
                                      id: value
                                          .searchArtist!.artists!.items![index].id!,
                                      artistName: value.searchArtist!.artists!
                                          .items![index].name!,
                                      imageUri: value.searchArtist!.artists!
                                              .items![index].images!.isNotEmpty
                                          ? value.searchArtist!.artists!
                                              .items![index].images![0].url!
                                          : "https://upload.wikimedia.org/wikipedia/commons/5/59/Empty.png?20091205084734",
                                      totalFollower: value.searchArtist!.artists!
                                          .items![index].followers!.total!),
                                ),
                              ),
                            )
                        ],
                      )
                      : const Text("");
                },
              ),
            ],
          ),
        ));
  }
}
