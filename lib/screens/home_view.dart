
import 'package:ff/providers/get_categories_provider.dart';
import 'package:ff/providers/get_new_realese_provider.dart';
import 'package:ff/services/refresh_token_service.dart';
import 'package:ff/services/search_artist_service.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GetNewRealeseProvider? newRealeseSong;
  GetCategoriesProvider? categories;
  @override
  void initState() {
    super.initState();
    newRealeseSong = Provider.of<GetNewRealeseProvider>(context, listen: false);
    categories = Provider.of<GetCategoriesProvider>(context, listen: false);
    newRealeseSong!.getNewRealeseSong();
    categories!.getCategories();
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
                    border: InputBorder.none,
                    prefixIconColor: Colors.black,
                    prefixIcon: InkWell(
                        onTap: () {
                          if (mycontroller.text.isNotEmpty) {
                            SearchArtistService(mycontroller.text);
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
                builder:
                    (BuildContext context, GetNewRealeseProvider value, widget) {
                  return newRealeseSong!.is_new_realese_song_loaded == true
                      ? Container(
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
                        )
                      : Container();
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
        
                      height: 22.h*categories!.categories!.categories!.items!.length/2,
                      
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount:
                            categories!.categories!.categories!.items!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Container(
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
                              padding: const EdgeInsets.only(top: 50),
                              child: Center(
                                  child: Text(
                                categories!
                                    .categories!.categories!.items![index].name!,
                                style: TextStyle(color: Colors.white),
                              )),
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
