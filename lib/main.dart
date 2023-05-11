import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isTurnO = true;
  var moveList = ['', '', '', '', '', '', '', '', ''];
  //if(isTurnO){
  // 'turn o'
  //}else {
  // 'turn x'
  //}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              isTurnO ? 'Turn O' : 'Turn X',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onTapped(index);
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Center(
                        child: Text('${moveList[index]}',
                            style: TextStyle(fontSize: 80)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }

  //end of build
  void onTapped(int index) {
    if (moveList[index].isNotEmpty) {
      return;
    }
    setState(() {
      if (isTurnO) {
        moveList[index] = 'O';
      } else {
        moveList[index] = 'X';
      }

      isTurnO = !isTurnO;
      print(moveList);
    });
  }
}
