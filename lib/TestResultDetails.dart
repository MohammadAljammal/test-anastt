import 'package:flutter/material.dart';
import 'package:test11/TestGroup.dart';

class TestResultDetails extends StatefulWidget {
  final TestResult testResult;

  TestResultDetails({Key? key, required this.testResult})
      : super(key: key);

  @override
  _TestResultDetailsState createState() => _TestResultDetailsState(testResult);
}

class _TestResultDetailsState extends State<TestResultDetails> {
  TestResult testResult;

  _TestResultDetailsState(this.testResult);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(testResult.testName ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                  flex: 2,
                  child: Image.asset(
                    'assets/test_header.png',
                    fit: BoxFit.fill,
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${testResult.testName ??''}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'normalRange',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              testResult.normalRanges ?? '',
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('testResult',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800])),
                            Text('${testResult.textResult ?? ''} ${testResult.unitName}'),
                          ],
                        ),
                      ),
                      if (testResult.createdDate != null)
                        SizedBox(height: 8),
                      if (testResult.createdDate != null)
                        Column(
                          children: [
                            Text('entryDate',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey[800])),

                            Text(testResult.createdDate!,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]))
                            // Text(previousResult.testDate!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blue[500])),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}