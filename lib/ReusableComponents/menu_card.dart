import 'package:breakfast/ReusableComponents/divider.dart';
import 'package:flutter/material.dart';
import 'package:breakfast/constances/Styes.dart';
import 'package:breakfast/screens/detail_screen.dart';

class MenuCard extends StatelessWidget {
  final Map<String, dynamic> menuData;
  const MenuCard({super.key, required this.menuData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  detailInfo: menuData,
                ),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                color: Color(0xffD8DFDF)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/${menuData['image']}'),
                  radius: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menuData['name'],
                      style: Styles.headerThreeTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      menuData['wight'],
                      style: Styles.headerFourTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${menuData['price'].toString()}',
                      style: Styles.buttonTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        DividerLine(),
      ],
    );
  }
}
