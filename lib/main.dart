import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/ordered_item.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderedItemData>(
      create: (context) => OrderedItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BreakFast',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

  

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 6,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: Text(widget.title),
//           actions: const [
//             Icon(
//               Icons.search,
//               size: 35,
//             ),
//             SizedBox(
//               width: 20,
//             )
//           ],
//           bottom: TabBar(
//             isScrollable: true,
//             tabs: [
//               Text('Sandwiches'),
//               Text('Baked Eggs'),
//               Text('Family Fast'),
//               Text('Parfaits and Tea'),
//               Text('Pizza and Coffee'),
//               Text('Bakery Fast'),
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           Container(),
//           Container(),
//           Container(),
//           Container(),
//           Container(),
//           Container(),
//         ]),
//         floatingActionButton: Container(
//           width: 70,
//           height: 70,
//           child: FloatingActionButton(
//             onPressed: (){},
//             tooltip: 'Increment',
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(
//                   Icons.shopping_bag, // Use Icons class for shopping bag
//                   size: 40.0, // Adjust the size as needed
//                   color: Colors.black, // Change the color if desired
//                 ),
//                 Text(
//                   '2',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//         ), // This trailing comma makes auto-formatting nicer for build methods.
//       ),
//     );
//   }
// }
