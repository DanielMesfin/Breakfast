import 'package:flutter/material.dart';
import 'package:breakfast/widgets/check_out_item.dart';
import 'package:breakfast/constances/Styes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:breakfast/models/ordered_item.dart';
import 'paymentScreen.dart';

class CheckOutScreen extends StatefulWidget {
  final List<Map<String, dynamic>> checkOutItem;
  const CheckOutScreen({Key? key, required this.checkOutItem})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    int itemCountNumber = Provider.of<OrderedItemData>(context).getCount();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${itemCountNumber.toString()} Item In Your Cart',
          style: Styles.headerOneTextStyle,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Styles.appBgColor,
      ),
      backgroundColor: Styles.appBgColor,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Column(
                children: widget.checkOutItem
                    .map(
                      (eachItem) => CheckOutItemOrdered(
                        menuData: eachItem,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: MaterialButton(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 68.w,
              ),
              color: Styles.buttonBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {
                Provider.of<OrderedItemData>(context, listen: false)
                    .checkOutAll();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                );
              },
              child: Text(
                "CheckOut \$${Provider.of<OrderedItemData>(context).totalCostInCart().toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
