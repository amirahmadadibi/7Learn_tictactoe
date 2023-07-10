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
  var winPositions = [-1, -1, -1];
  int filedPositions = 0;
  String winnerTitle = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'pm'),
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 36,
                    width: 148,
                    child: Image.asset('assets/images/logo.png')),
                SizedBox(
                  height: 50,
                ),
                Visibility(
                  visible: winnerTitle.isNotEmpty,
                  child: Text(
                    'game is over : $winnerTitle',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffAAB0BD)),
                  ),
                ),
                Visibility(
                  visible: winnerTitle.isEmpty,
                  child: Text(
                    'Turn',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffAAB0BD)),
                  ),
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
                      width: 150,
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
                                color: (winnerTitle.isNotEmpty &&
                                        winPositions.contains(index))
                                    ? Color(0xff1A007BEC)
                                    : Color(0xfff5f5f5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text('${moveList[index]}',
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: (winnerTitle.isNotEmpty &&
                                              winPositions.contains(index))
                                          ? Color(0xff007BEC)
                                          : Colors.black)),
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
      winPositions = [-1, -1, -1];//0 0 0 
    });
  }

  //end of build
  void onTapped(int index) {
    if (moveList[index].isNotEmpty) {
      return;
    }
    filedPositions = filedPositions + 1;

    print(winPositions);
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
    });
  }

  int checkWinner() {
    if (moveList[0] == moveList[1] &&
        moveList[0] == moveList[2] &&
        moveList[0].isNotEmpty) {
      winPositions = [0, 1, 2];
      return 1;
    }
    if (moveList[3] == moveList[4] &&
        moveList[3] == moveList[5] &&
        moveList[3].isNotEmpty) {
      winPositions = [3, 4, 5];

      return 1;
    }
    if (moveList[6] == moveList[7] &&
        moveList[6] == moveList[8] &&
        moveList[6].isNotEmpty) {
      winPositions = [6, 7, 8];

      return 1;
    }
    if (moveList[0] == moveList[3] &&
        moveList[0] == moveList[6] &&
        moveList[0].isNotEmpty) {
      winPositions = [0, 3, 6];

      return 1;
    }
    if (moveList[1] == moveList[4] &&
        moveList[1] == moveList[7] &&
        moveList[1].isNotEmpty) {
      winPositions = [1, 4, 7];

      return 1;
    }
    if (moveList[2] == moveList[5] &&
        moveList[2] == moveList[8] &&
        moveList[2].isNotEmpty) {
      winPositions = [2, 5, 8];

      return 1;
    }
    if (moveList[0] == moveList[4] &&
        moveList[0] == moveList[8] &&
        moveList[0].isNotEmpty) {
      winPositions = [0, 4, 8];

      return 1;
    }
    if (moveList[2] == moveList[4] &&
        moveList[2] == moveList[6] &&
        moveList[2].isNotEmpty) {
      winPositions = [2, 4, 6];
      return 1;
    }

    if (filedPositions == 9) {
      winPositions = [-1, -1, -1];
      return 0;
    }

    return -1;
  }
}
