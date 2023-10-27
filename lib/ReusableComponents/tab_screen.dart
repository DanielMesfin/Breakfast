import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../constances/get_size.dart';
import 'menu_card.dart';

Container TabOne(BuildContext context, int itemCountNumber,
    List<Map<String, dynamic>> listItems) {
  return Container(
    color: const Color(0xffD8DFDF),
    child: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: GetSize.getScreenHeight(10),
          ),
          child: Column(
            children: [
              // // TODO the way of having to help the ??
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 5.0),
              //   height: 30.0,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: <Widget>[
              //       // TODO the state of each text...
              //       InkWell(
              //         onTap: () {
              //           setState(() {
              //             textStyleAnimated = const TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 18,
              //                 fontWeight: FontWeight.bold,
              //                 decoration: TextDecoration.underline,
              //                 decorationColor: Styles.buttonBgColor,
              //                 decorationThickness: 7);
              //           });
              //         },
              //         child: Text(
              //           'New',
              //           style: textStyleAnimated,
              //         ),
              //       ),
              //       Gap(
              //         GetSize.getScreenWidth(30),
              //       ),
              //       const Text('Burgers', style: Styles.boldTextStyle),
              //       Gap(
              //         GetSize.getScreenWidth(30),
              //       ),
              //       const Text('Pizza', style: Styles.boldTextStyle),
              //       Gap(
              //         GetSize.getScreenWidth(30),
              //       ),
              //       const Text('Drink', style: Styles.boldTextStyle),
              //       Gap(
              //         GetSize.getScreenWidth(30),
              //       ),
              //       const Text('Sushi', style: Styles.boldTextStyle),
              //       Gap(
              //         GetSize.getScreenWidth(30),
              //       ),
              //       const Text('Sweet', style: Styles.boldTextStyle),
              //     ],
              //   ),
              // ),
              Gap(
                GetSize.getScreenHeight(20),
              ),

              Column(
                children: listItems
                    .map((foodinfo) => MenuCard(menuData: foodinfo))
                    .toList(),
              ),
              Gap(
                GetSize.getScreenHeight(10),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
