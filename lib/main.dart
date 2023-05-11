import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                );
              })
          // GridView.count(
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   children: [
          //     Text('text'),
          //     Text('text'),
          //     Text('text'),
          //     Text('text'),
          //     Text('text'),
          //   ],
          // ),
          ),
    );
  }
}
