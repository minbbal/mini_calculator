import 'package:flutter/material.dart';

class myScreen extends StatefulWidget {
  myScreen({super.key});

  @override
  State<myScreen> createState() => _myScreenState();
}

class _myScreenState extends State<myScreen> {
  String mainText = '';
  String subText = '';
  dynamic prevNum = 0;
  dynamic nowNum = 0;
  List<dynamic> totalList = [];
  List<dynamic> calcList = [];
  List<dynamic> _cal = ['*', '/', '+', '-', 'C'];

  @override
  void initState() {
    super.initState();
    mainText = '';
    subText = '';
    totalList = [];
    calcList = [];
  }

  void prevResult() {
    String t = '';
    if (totalList.length > 2) {
      for (int i = 0; i < totalList.length; i++) {
        if (i % 3 == 0) {
          t += '=${totalList[i]}\n${totalList[i]}';
        } else {
          t += '${totalList[i]}';
        }
      }
    }
    print(t + '=');
    // return t;
  }

  void _incrementCounter() {}

  void onCancelPressed() {
    setState(() {
      mainText = '';
      subText = '';
      calcList = [];
    });
  }

  void onNumberPressed(int num) {
    setState(() {
      mainText += '${num}';
    });
  }

  void onCalcPressed(String calc) {
    setState(() {
      print('tt');
      print(calcList);
      String addText = '';
      List<String> t = mainText.split('');

      t.forEach((_tv) {
        print(_tv);
        if (_cal!.contains(_tv)) {
          return;
        } else {
          addText += '${_tv}';
        }
        prevNum = double.parse(addText);
      });

      if (!_cal.contains(t.last)) {
        // 마지막에 눌린값이 숫자이면서
        print('마지막에 눌린값이 숫자');
        _cal.forEach((c) {
          if (calcList!.contains(c)) {
            //앞에 기호가 있는경우
            print('앞에 기호가 있는경우');
            nowNum = calcList[1];
            switch (calc) {
              case '*':
                mainText = (prevNum * nowNum).toString();
                break;
              case '/':
                mainText = (prevNum / nowNum).toString();
                break;
              case '+':
                mainText = (prevNum + nowNum).toString();
                break;
              case '-':
                mainText = (prevNum - nowNum).toString();
                break;
              default:
                onCancelPressed();
                break;
            }
          } else {
            // 앞에 기호가 없는경우
            print('앞에 기호가 없는경우');
          }
        });
        totalList.add(prevNum);
        totalList.add(calc);
        //calcList.add(prevNum);
        calcList.add(calc);
      } else {
        print('숫자가 아닌 기호인경우 변경');
        // 숫자가 아닌 기호인경우 변경해주기
        totalList.removeLast();
        totalList.add(calc);
        calcList.removeLast();
        calcList.add(calc);
        t.removeLast();
        mainText = '';
        t.forEach((el) {
          mainText += el;
        });
      }
      mainText += '${calc}';
      print(calcList);
    });
  }

  void onFinishPressed() {
    setState(() {
      nowNum = double.parse(mainText.split(calcList.last).last);
      calcList.add(nowNum);
      totalList.add(nowNum);
      print(':::${prevNum}');
      print(':::${nowNum}');
      String calcValue = '';
      print(':::${calcList}');
      calcList.forEach((c) {
        print(calcValue);
        switch (c) {
          case '*':
            calcValue = (prevNum * nowNum).toString();
            break;
          case '/':
            calcValue = (prevNum / nowNum).toString();
            break;
          case '+':
            calcValue = (prevNum + nowNum).toString();
            break;
          case '-':
            calcValue = (prevNum - nowNum).toString();
            break;
          default:
            //prevNum = c;
            break;
        }
      });
      calcList = [];
      prevNum = double.parse(calcValue);
      subText = '${prevNum}';
      calcList.add(prevNum);
      if (calcList.isNotEmpty &&
          (calcList[0] is int || calcList[0] is double)) {
        mainText = '${calcValue}';
        //print(totalList);
        //prevResult();
      }
      print(calcList);
      prevResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'MiniCalurater',
          style: TextStyle(
            color: Theme.of(context).cardColor,
            fontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
          ),
        ),
      ),

      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${mainText}',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.displayLarge?.fontSize,
                      color: Theme.of(context).textTheme.displayLarge?.color,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '= ${subText}',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.displaySmall?.fontSize,
                      color: Theme.of(context).textTheme.displaySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onNumberPressed(7);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '7',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(8);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '8',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(9);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '9',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onCancelPressed();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'C',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onNumberPressed(4);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(5);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(6);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onCalcPressed('*');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '*',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onNumberPressed(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(2);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(3);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onCalcPressed('/');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onCalcPressed('+');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onNumberPressed(0);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          onCalcPressed('-');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: onFinishPressed,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            '=',
                            style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.fontSize,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
