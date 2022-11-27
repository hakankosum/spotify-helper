import 'package:ff/screens/artics_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchedItem extends StatefulWidget {
  const SearchedItem(
      {super.key,
      required this.artistName,
      required this.imageUri,
      required this.totalFollower, required this.id});
  final String artistName;
  final String imageUri;
  final int totalFollower;
  final String id;

  @override
  State<SearchedItem> createState() => _SearchedItemState();
}

class _SearchedItemState extends State<SearchedItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticsPageView(id: widget.id)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.h),
        height: 8.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        child: Row(
          children: [
            SizedBox(width: 6.w),
            Container(
              height: 7.h,
              width: 7.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(fit: BoxFit.fill,image: NetworkImage(widget.imageUri))),
            ),
            SizedBox(width: 2.w),
            Expanded(child: Text(widget.artistName)),
            SizedBox(width: 10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Toplam takipçi: "),
                Text(widget.totalFollower.toString()),
              ],
            ),
            SizedBox(width: 6.w),
          ],
        ),
      ),
    );
  }
}
