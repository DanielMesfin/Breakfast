import 'package:flutter/material.dart';
import 'package:breakfast/ReusableComponents/check_out_item.dart';
import 'package:breakfast/constances/Styes.dart';
import 'package:breakfast/ReusableComponents/resueable_icon.dart';
import 'package:provider/provider.dart';
import 'package:breakfast/models/ordered_item.dart';
import '../ReusableComponents/reusabelOptionButton.dart';
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
              const SizedBox(
                height: 3,
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
              const SizedBox(
                height: 15,
              ),
            ],
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 68,
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
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         scrollable: true,
                //         icon: const ReusableIcon(
                //           iconData: Icons.payments_rounded,
                //         ),
                //         shadowColor: Colors.grey,
                //         backgroundColor: Styles.cardBgColor,
                //         elevation: 7.8,
                //         title: const Text(
                //           'Check Out All ',
                //           textAlign: TextAlign.center,
                //           style: TextStyle(color: Colors.white),
                //         ),
                //         actionsAlignment: MainAxisAlignment.center,
                //         content: ListBody(
                //           children: [
                //             Text(
                //               'Total cost of Your Item \$${Provider.of<OrderedItemData>(context).totalCostInCart().toStringAsFixed(2)}',
                //               style: const TextStyle(color: Colors.white),
                //               textAlign: TextAlign.center,
                //             ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 OptionButton(
                //                   buttonColor: Colors.blueAccent,
                //                   buttonLabel: 'ok',
                //                   actionTakenOnCartItem: () {
                //                     Provider.of<OrderedItemData>(context,
                //                             listen: false)
                //                         .checkOutAll();
                //                     Navigator.pop(context);
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                         builder: (context) =>
                //                             const PaymentScreen(),
                //                       ),
                //                     );
                //                   },
                //                 ),
                //                 OptionButton(
                //                   buttonColor: Colors.redAccent,
                //                   buttonLabel: 'Cancel',
                //                   actionTakenOnCartItem: () =>
                //                       Navigator.pop(context),
                //                 )
                //               ],
                //             )
                //           ],
                //         ),
                //         shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(2.0),
                //           ),
                //         ),
                //       );
                //     });
              },
              child: Text(
                "CheckOut \$${Provider.of<OrderedItemData>(context).totalCostInCart().toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
