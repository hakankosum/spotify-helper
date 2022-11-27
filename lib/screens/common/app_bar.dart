import 'package:ff/providers/bottom_nav_provider.dart';
import 'package:ff/providers/search_artist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../search_view.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  SearchArtistProvider? searchArtistProvider;
  BottomNavProvider? bottomNavProvider;

  @override
  void initState() {
    searchArtistProvider =
        Provider.of<SearchArtistProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder:
        (BuildContext context, SearchArtistProvider value, Widget? child) {
      return Container(
        height: 4.h,
        width: 100.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search artist or track",
            border: InputBorder.none,
            prefixIconColor: Colors.black,
            prefixIcon: InkWell(
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    value.getArtistList(controller.text);
                    bottomNavProvider?.colors[1]=Colors.green;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchView()));
                  }
                },
                child: const Icon(
                  Icons.search,
                  size: 24,
                )),
          ),
        ),
      );
    });
  }
}
