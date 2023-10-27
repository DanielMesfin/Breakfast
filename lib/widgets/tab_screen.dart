import 'package:flutter/material.dart';
import 'menu_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container TabOne(BuildContext context, int itemCountNumber,
    List<Map<String, dynamic>> listItems) {
  return Container(
    color: const Color(0xffD8DFDF),
    child: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 10.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Column(
                children: listItems
                    .map((foodinfo) => MenuCard(menuData: foodinfo))
                    .toList(),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ],
    ),
  );
}
