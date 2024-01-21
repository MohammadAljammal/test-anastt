import 'package:flutter/material.dart';
import 'package:test11/TestGroup.dart';


class TestItem extends StatelessWidget {
  final TestResult testResult;

  const TestItem({Key? key,  required this.testResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return testResult.resultType == 3
        ? NumericTestResult(
      testResult: testResult,
    )
        : testResult.resultType == 4
        ? CultureTestResult(testResult: testResult)
        : TextTestResult(testResult: testResult);
  }
}

class NumericTestResult extends StatelessWidget {


  final TestResult testResult;

  const NumericTestResult({Key? key, required this.testResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    // Share.share(PdfGenerator());
                  },
                  icon: Icon(Icons.share)),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 8),

              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      testResult.testName!,
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Normal Ranges',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(testResult.normalRanges??'',
                            style: TextStyle(fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            '${testResult.result}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: testResult.result! >
                              testResult.maxNormalResult!
                              ? true
                              : testResult.result! < testResult.minNormalResult!
                              ? true
                              : false,
                          child: Icon(
                            testResult.result! > testResult.maxNormalResult!
                                ? Icons.arrow_upward
                                : testResult.result! < testResult.minNormalResult!
                                ? Icons.arrow_downward
                                : Icons.dehaze,
                            color: testResult.result! >
                                testResult.maxNormalResult!
                                ? Colors.red[400]
                                : testResult.result! < testResult.minNormalResult!
                                ? Colors.amber
                                : Colors.green[400],
                          ),
                        ),
                        Visibility(
                          visible: testResult.result! >
                              testResult.maxNormalResult!
                              ? false
                              : testResult.result! < testResult.minNormalResult!
                              ? false
                              : true,
                          child: Container(
                            width: 3,
                            height: 50,
                            color: Colors.green[500],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          testResult.unitName ?? '',
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextTestResult extends StatelessWidget {
  final TestResult testResult;

  const TextTestResult({ Key? key,  required this.testResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => TestResultDetails(
        //           testResult: testResult,
        //         )));
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 8),
                      child: Text(testResult.testName!,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Result',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${testResult.textResult ??''}' ' ' '${testResult.unitName}',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CultureTestResult extends StatelessWidget {
  final TestResult testResult;

  const CultureTestResult({Key? key,  required this.testResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) =>
          //             CultureTestDetails(testResult: testResult)));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  testResult.testName!,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),overflow: TextOverflow.ellipsis,softWrap: true,
                ),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}