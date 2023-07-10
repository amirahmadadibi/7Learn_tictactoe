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
  int filedPositions = 0;
  String winnerTitle = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Turn',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffAAB0BD)),
                ),
                Text(
                  isTurnO ? 'O' : 'X',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: winnerTitle.isNotEmpty,
                  child: GestureDetector(
                    onTap: () {
                      repeatGame();
                    },
                    child: Container(
                      height: 39,
                      width: 131,
                      decoration: BoxDecoration(
                          color: Color(0xff33428DED),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/refresh.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Repeat Game',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff428DED)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Visibility(
                  visible: winnerTitle.isNotEmpty,
                  child: Text(
                    'game is over : $winnerTitle',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            onTapped(index);
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F5F5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text('${moveList[index]}',
                                  style: TextStyle(fontSize: 60)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void repeatGame() {
    setState(() {
      isTurnO = true;
      moveList = ['', '', '', '', '', '', '', '', ''];
      filedPositions = 0;
      winnerTitle = '';
    });
  }

  //end of build
  void onTapped(int index) {
    if (moveList[index].isNotEmpty) {
      return;
    }
    filedPositions = filedPositions + 1;
    print(filedPositions);
    setState(() {
      if (isTurnO) {
        moveList[index] = 'O';
      } else {
        moveList[index] = 'X';
      }

      int result = checkWinner();
      if (result == 1) {
        winnerTitle = isTurnO ? 'O' : 'X';
      } else if (result == 0) {
        winnerTitle = 'draw';
      }

      isTurnO = !isTurnO;

      print(moveList);
    });
  }

  int checkWinner() {
    if (moveList[0] == moveList[1] &&
        moveList[0] == moveList[2] &&
        moveList[0].isNotEmpty) {
      return 1;
    }
    if (moveList[3] == moveList[4] &&
        moveList[3] == moveList[5] &&
        moveList[3].isNotEmpty) {
      return 1;
    }
    if (moveList[6] == moveList[7] &&
        moveList[6] == moveList[8] &&
        moveList[6].isNotEmpty) {
      return 1;
    }
    if (moveList[0] == moveList[3] &&
        moveList[0] == moveList[6] &&
        moveList[0].isNotEmpty) {
      return 1;
    }
    if (moveList[1] == moveList[4] &&
        moveList[1] == moveList[7] &&
        moveList[1].isNotEmpty) {
      return 1;
    }
    if (moveList[2] == moveList[5] &&
        moveList[2] == moveList[8] &&
        moveList[2].isNotEmpty) {
      return 1;
    }
    if (moveList[0] == moveList[4] &&
        moveList[0] == moveList[8] &&
        moveList[0].isNotEmpty) {
      return 1;
    }
    if (moveList[2] == moveList[4] &&
        moveList[2] == moveList[6] &&
        moveList[2].isNotEmpty) {
      return 1;
    }

    if (filedPositions == 9) {
      return 0;
    }

    return -1;
  }
}
