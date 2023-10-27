import 'package:breakfast/models/ordered_item.dart';
import 'package:breakfast/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:breakfast/constances/Styes.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> detailInfo;
  const DetailScreen({Key? key, required this.detailInfo}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Customer';
    int selectedNumber = widget.detailInfo['amount'];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Styles.appBgColor,
        body: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                'images/${widget.detailInfo['image']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 15,
                          top: 20,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Icon(
                                Icons.arrow_back,
                                size: 40,
                                color: Color.fromARGB(255, 17, 72, 40),
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.detailInfo['name'].toString()}',
                          style: Styles.headerOneTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.detailInfo['price'].toString()}',
                          style: Styles.headerThreeTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.detailInfo['wight'].toString(),
                          style: Styles.headerThreeTextStyle.copyWith(
                              fontSize: 16,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Quality', style: Styles.linkText),
                            const SizedBox(
                              width: 30,
                            ),
                            DropdownButton<int>(
                              underline: Container(),
                              value: selectedNumber,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedNumber = newValue ?? 0;
                                });
                              },
                              items: List.generate(20, (index) {
                                return DropdownMenuItem<int>(
                                  value: index + 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      '${index + 1}',
                                      style: Styles.linkText.copyWith(
                                          decoration: TextDecoration.none),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65),
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            value: selectedValue,
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Customer',
                              'Option 2',
                              'Option 3',
                              'Option 4'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: Styles.linkText,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    child: Row(
                      children: [
                        AddingComponetes(),
                        SizedBox(
                          width: 8,
                        ),
                        AddingComponetes(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 55),
                      color: Styles.cartgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      onPressed: () {
                        if (widget.detailInfo.containsKey('id') ==
                            widget.detailInfo.containsKey('id')) {
                          widget.detailInfo['totalPrice'] =
                              widget.detailInfo['price'] *
                                  itemCount.roundToDouble();
                          widget.detailInfo['amount'] = itemCount;
                        }
                        Provider.of<OrderedItemData>(context, listen: false)
                            .addOrderedItem(widget.detailInfo);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ),
                        );
                      },
                      child: Text(
                        'Add To Order \$${widget.detailInfo['price']}',
                        style: Styles.buttonTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddingComponetes extends StatelessWidget {
  const AddingComponetes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 4, right: 4, bottom: 8),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Styles.buttonBgColor,
                  radius: 10,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Suger',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Styles.buttonBgColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$125',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '12.5 cal',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ]),
    );
  }
}
