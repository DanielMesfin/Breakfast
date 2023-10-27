import 'package:flutter/material.dart';
import 'package:breakfast/constances/Styes.dart';
import 'package:breakfast/models/menu_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:breakfast/models/ordered_item.dart';
import '../widgets/menu_card.dart';
import 'check_out_screen.dart';

class MyHomePage extends StatefulWidget {
  static const String id = 'home_page';
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle textStyleAnimated = Styles.boldTextStyle;
  List<Map<String, dynamic>> itemInBag = [];
  @override
  Widget build(BuildContext context) {
    int itemCountNumber = Provider.of<OrderedItemData>(context).getCount();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffD6DCDF),
          title: const Text(
            'BREAKFAST',
            style: Styles.headerOneTextStyle,
          ),
          toolbarHeight: 45.h,
          actions: [
            Icon(
              Icons.search,
              size: 35.w,
            ),
            SizedBox(
              width: 20.h,
            )
          ],
          bottom: const TabBar(
            indicatorWeight: 4,
            enableFeedback: true,
            isScrollable: true,
            tabs: [
              Text(
                'Sandwiches',
                style: Styles.headerTwoTextStyle,
              ),
              Text(
                'Baked Eggs',
                style: Styles.headerTwoTextStyle,
              ),
              Text(
                'Family Fast',
                style: Styles.headerTwoTextStyle,
              ),
              Text(
                'Parfaits and Tea',
                style: Styles.headerTwoTextStyle,
              ),
              Text(
                'Pizza and Coffee',
                style: Styles.headerTwoTextStyle,
              ),
              Text(
                'Bakery Fast',
                style: Styles.headerTwoTextStyle,
              ),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: TabBarView(children: [
          TabData(listItems: menuList),
          TabData(listItems: menuList2),
          TabData(listItems: menuList3),
          TabData(listItems: menuList4),
          TabData(listItems: menuList5),
          TabData(listItems: menuList6),
        ]),
        floatingActionButton: SizedBox(
          width: 60.w,
          height: 60.w,
          child: FloatingActionButton(
            backgroundColor:
                itemCountNumber > 0 ? const Color(0xffBCC536) : Colors.white70,
            onPressed: () {
              if (itemCountNumber > 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckOutScreen(
                      checkOutItem:
                          Provider.of<OrderedItemData>(context).itemInBag,
                    ),
                  ),
                );
              }
            },
            tooltip: 'Increment',
            child: Stack(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (itemCountNumber > 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckOutScreen(
                            checkOutItem:
                                Provider.of<OrderedItemData>(context).itemInBag,
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 38.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 9.w, top: 13.h),
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    child: itemCountNumber > 0
                        ? Text(
                            itemCountNumber.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: Colors.red),
                          )
                        : const Text(''),
                  ),
                )
              ],
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class TabData extends StatelessWidget {
  final List<Map<String, dynamic>> listItems;
  const TabData({super.key, required this.listItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffD8DFDF),
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 10.h,
        ),
        children: [
          Column(
            children: [
              SizedBox(height: 10.h),
              Column(
                children: listItems
                    .map((foodinfo) => MenuCard(menuData: foodinfo))
                    .toList(),
              ),
              SizedBox(height: 10.h)
            ],
          ),
        ],
      ),
    );
  }
}
