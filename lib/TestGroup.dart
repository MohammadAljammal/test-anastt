// To parse this JSON data, do
//
//     final microbiologyResult = microbiologyResultFromMap(jsonString);



/*
[
  {
"visitId": 5989,
"visitDate": "2022-09-11T12:09:56.457+03:00",
 "sectionName": "Medical Lab","doctorName": "Laith Nayef  Habahbeh",
     "hospital": "Istishari"
  }
 ]
 visit for group id is 5989
 */
import 'dart:convert';

class TestGroup {
  TestGroup({
    this.groupId,
    this.groupName,
    this.groupForeignName,
    this.testResults,
    this.groupCode
  });

  int? groupId;
  String? groupName;
  String? groupForeignName;
  String? groupCode;
  List<TestResult>? testResults;

  factory TestGroup.fromJson(String str) => TestGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TestGroup.fromMap(Map<String, dynamic> json) => TestGroup(
      groupId: json["groupId"] == null ? null : json["groupId"],
      groupName: json["groupName"],
      groupForeignName: json["groupForeignName"],
      testResults: json["testResults"] == null
          ? null
          : List<TestResult>.from(
          json["testResults"].map((x) => TestResult.fromMap(x))),groupCode: json["groupCode"] ==null? "": json["groupCode"]
  );

  Map<String, dynamic> toMap() => {
    "groupId": groupId == null ? null : groupId,
    "groupName": groupName,
    "groupForeignName": groupForeignName,
    "testResults": testResults == null
        ? null
        : List<dynamic>.from(testResults!.map((x) => x.toMap())),
    "groupCode":groupCode
  };
}

class TestResult {
  TestResult({
    this.id,
    this.testName,
    this.unitName,
    this.resultType,
    this.resultStatus,
    this.result,
    this.normalRanges,
    this.createdDate,
    this.sectionTitle,
    this.textResult,
    this.listResult,
    this.minNormalResult,
    this.maxNormalResult,
    this.microbiologyResults,
    this.prevResults,
    this.testCode,
  });

  int? id;
  String? testName;
  dynamic unitName;
  int? resultType;
  int? resultStatus;
  double? result;
  String? normalRanges;
  String? createdDate;
  String? sectionTitle;
  String? textResult;
  String? listResult;
  String? testCode;
  double? minNormalResult;
  double? maxNormalResult;
  List<MicrobiologyTest>? microbiologyResults;
  List<PreviousResult>? prevResults;
//"testCode": "IGE",
  TestResult copyWith({
    int? id,
    String? testName,
    dynamic unitName,
    int? resultType,
    int? resultStatus,
    double? result,
    String? normalRanges,
    String? createdDate,
    String? sectionTitle,
    String? textResult,
    String? testCode,
    String? listResult,
    double? minNormalResult,
    double? maxNormalResult,
    List<MicrobiologyTest>? microbiologyResults,
    List<PreviousResult>? prevResult
  }) =>
      TestResult(
        id: id ?? this.id,
        testName: testName ?? this.testName,
        unitName: unitName ?? this.unitName,
        resultType: resultType ?? this.resultType,
        resultStatus: resultStatus ?? this.resultStatus,
        result: result ?? this.result,
        normalRanges: normalRanges ?? this.normalRanges,
        createdDate: createdDate ?? this.createdDate,
        sectionTitle: sectionTitle ?? this.sectionTitle,
        textResult: textResult ?? this.textResult,
        listResult: listResult ?? this.listResult,
        minNormalResult: minNormalResult ?? this.minNormalResult,
        maxNormalResult: maxNormalResult ?? this.maxNormalResult,
        microbiologyResults: microbiologyResults ?? this.microbiologyResults,
        prevResults: prevResults ?? this.prevResults, testCode: testCode,
      );

  factory TestResult.fromJson(String str) =>
      TestResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TestResult.fromMap(Map<String, dynamic> json) => TestResult(
      id: json["id"] == null ? null : json["id"],
      testName: json["testName"] == null ? null : json["testName"],
      unitName: json["unitName"],
      resultType: json["resultType"] == null ? null : json["resultType"],
      resultStatus:
      json["resultStatus"] == null ? null : json["resultStatus"],
      result: json["result"],
      normalRanges:
      json["normalRanges"] == null ? null : json["normalRanges"],
      createdDate: json["createdDate"] == null ? null : json["createdDate"],
      sectionTitle:
      json["sectionTitle"] == null ? null : json["sectionTitle"],
      textResult: json["textResult"] == null ? null : json["textResult"],
      listResult: json["listResult"] == null ? null : json["listResult"],
      minNormalResult:
      json["minNormalResult"] == null ? null : json["minNormalResult"],
      maxNormalResult:
      json["maxNormalResult"] == null ? null : json["maxNormalResult"],
      microbiologyResults: json["microbiologyResults"] == null ? null :  List<MicrobiologyTest>.from(json["microbiologyResults"]
          .map((x) => MicrobiologyTest.fromMap(x))),
      prevResults: json["prevResults"] == null ? null : List<PreviousResult>.from(
          json["prevResults"].map((x) => PreviousResult.fromMap(x))),
      testCode:  json["testCode"]
  );

  Map<String, dynamic> toMap() => {
    "id":  id,
    "testName":  testName,
    "unitName": unitName,
    "resultType":  resultType,
    "resultStatus": resultStatus,
    "result": result,
    "normalRanges": normalRanges,
    "createdDate":  createdDate,
    "sectionTitle":  sectionTitle,
    "textResult":  textResult,
    "listResult":  listResult,
    "minNormalResult":  minNormalResult,
    "maxNormalResult":  maxNormalResult,
    "microbiologyResults":  List<dynamic>.from(microbiologyResults!.map((x) => x.toMap())),
    "prevResults": List<dynamic>.from(prevResults!.map((x) => x.toMap())),
    "testCode": testCode
  };
}

class MicrobiologyTest {
  MicrobiologyTest({
    this.testResultId,
    this.specimenType,
    this.remarks,
    this.microbilogyPanelTitle,
    this.microbilogyPanelForeignTitle,
    this.colonyCount,
    this.colonyCountDesc,
    this.results,
  });

  int? testResultId;
  String? specimenType;
  String? remarks;
  String? microbilogyPanelTitle;
  String? microbilogyPanelForeignTitle;
  double? colonyCount;
  String? colonyCountDesc;
  List<MicrobiologyResult>? results;



  factory MicrobiologyTest.fromJson(String str) =>
      MicrobiologyTest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MicrobiologyTest.fromMap(Map<String, dynamic> json) =>
      MicrobiologyTest(
        testResultId:
        json["testResultId"],
        specimenType:
        json["specimenType"],
        remarks:  json["remarks"],
        microbilogyPanelTitle:  json["microbilogyPanelTitle"],
        microbilogyPanelForeignTitle:
        json["microbilogyPanelForeignTitle"],
        colonyCount:  json["colonyCount"],
        colonyCountDesc:
        json["colonyCountDesc"],
        results: json["results"] == null
            ? null
            : List<MicrobiologyResult>.from(
            json["results"].map((x) => MicrobiologyResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "testResultId": testResultId == null ? null : testResultId,
    "specimenType": specimenType == null ? null : specimenType,
    "remarks": remarks == null ? null : remarks,
    "microbilogyPanelTitle":
    microbilogyPanelTitle == null ? null : microbilogyPanelTitle,
    "microbilogyPanelForeignTitle": microbilogyPanelForeignTitle == null
        ? null
        : microbilogyPanelForeignTitle,
    "colonyCount": colonyCount == null ? null : colonyCount,
    "colonyCountDesc": colonyCountDesc == null ? null : colonyCountDesc,
    "results": results == null
        ? null
        : List<dynamic>.from(results!.map((x) => x.toMap())),
  };
}

class MicrobiologyResult {
  MicrobiologyResult({
    this.microbiologyResultId,
    this.antibioticTitle,
    this.resultId,
    this.resultTitle,
  });

  int? microbiologyResultId;
  String? antibioticTitle;
  double? resultId;
  String? resultTitle;



  factory MicrobiologyResult.fromJson(String str) =>
      MicrobiologyResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MicrobiologyResult.fromMap(Map<String, dynamic> json) =>
      MicrobiologyResult(
        microbiologyResultId: json["microbiologyResultId"] == null
            ? null
            : json["microbiologyResultId"],
        antibioticTitle:
        json["antibioticTitle"] == null ? null : json["antibioticTitle"],
        resultId: json["resultId"] == null ? null : json["resultId"].toDouble(),
        resultTitle: json["resultTitle"] == null ? null : json["resultTitle"],
      );

  Map<String, dynamic> toMap() => {
    "microbiologyResultId":
    microbiologyResultId == null ? null : microbiologyResultId,
    "antibioticTitle": antibioticTitle == null ? null : antibioticTitle,
    "resultId": resultId == null ? null : resultId,
    "resultTitle": resultTitle == null ? null : resultTitle,
  };
}

class PreviousResult {
  PreviousResult({
    this.resultType,
    this.result,
    this.testDate,
  });

  int? resultType;
  String? result;
  String? testDate;



  factory PreviousResult.fromJson(String str) =>
      PreviousResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PreviousResult.fromMap(Map<String, dynamic> json) => PreviousResult(
    resultType: json["resultType"] == null ? null : json["resultType"],
    result: json["result"] == null ? null : json["result"],
    testDate: json["testDate"] == null ? null : json["testDate"],


  );

  Map<String, dynamic> toMap() => {
    "resultType": resultType == null ? null : resultType,
    "result": result == null ? null : result,
    "testDate": testDate == null ? null : testDate,
  };
}