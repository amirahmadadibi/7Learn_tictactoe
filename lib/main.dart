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

      checkWinner();

      isTurnO = !isTurnO;
      
      print(moveList);
    });
  }

  void checkWinner() {
    if (moveList[0] == moveList[1] &&
        moveList[0] == moveList[2] &&
        moveList[0].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[3] == moveList[4] &&
        moveList[3] == moveList[5] &&
        moveList[3].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[6] == moveList[7] &&
        moveList[6] == moveList[8] &&
        moveList[6].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[0] == moveList[3] &&
        moveList[0] == moveList[6] &&
        moveList[0].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[1] == moveList[4] &&
        moveList[1] == moveList[7] &&
        moveList[1].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[2] == moveList[5] &&
        moveList[2] == moveList[8] &&
        moveList[2].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[0] == moveList[4] &&
        moveList[0] == moveList[8] &&
        moveList[0].isNotEmpty) {
      print('win');
      return;
    }
    if (moveList[2] == moveList[4] &&
        moveList[2] == moveList[6] &&
        moveList[2].isNotEmpty) {
      print('win');
      return;
    }
  }
}
