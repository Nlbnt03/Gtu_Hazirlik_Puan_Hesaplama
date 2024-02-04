import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hazirlik_puan_hesaplama/last_menu.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';

class dateCounter extends StatefulWidget {
  const dateCounter({super.key});

  @override
  State<dateCounter> createState() => _dateCounterState();
}

class _dateCounterState extends State<dateCounter> {
  List<DateTime> examDates = [
    DateTime(2024, 3, 21, 9, 0, 0),
    DateTime(2024, 3, 25, 9, 0, 0),
    DateTime(2024, 3, 26, 9, 0, 0),
    DateTime(2024, 5, 2,  9, 0, 0),
    DateTime(2024, 5, 6,  9, 0, 0),
    DateTime(2024, 5, 7,  9, 0, 0),
    DateTime(2024, 6, 10, 9, 0, 0),
    DateTime(2024, 6, 14, 10, 0, 0),
  ];

  List<String> examName = [
    "1. Okuma Sınavı",
    "2. Dönem 1. Vize",
    "Konuşma Sınavı",
    "2. Okuma Sınavı",
    "2. Dönem 2. Vize",
    "Sunum Yapma",
    "Final Sınavı",
    "Yeterlilik Sınavı",
  ];

  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTimes = examDates.map((date) => date.difference(DateTime.now())).toList();
      });
    });
  }

  List<Duration> remainingTimes = [];

  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context) => lastMenu(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Sınavlara Kalan Süre",style: TextStyle(color: yaziRenk,fontFamily: "Quicksand",fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: appbarRenk,

      ),
      backgroundColor: menuRenk,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3
        ),
        itemCount: remainingTimes.length,
        itemBuilder: (BuildContext context, int index) {
          Duration remainingTime = remainingTimes[index];
          bool isExamPassed = remainingTime.isNegative;

          DateTime dateTime = examDates[index];
          String formattedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';

          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF414345), Color(0xFF000000)],
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      examName[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: "kanit",
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text("( ${formattedDate} )",style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: "kanit",
                      fontSize: 18,
                      color: Colors.white,
                    ),)
                  ],
                ),
                SizedBox(height: 8),
                isExamPassed
                    ? Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                  "Bu sınavın tarihi geçmiştir !",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color(0xffF00000),
                  ),
                ),
                    )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: ShapeDecoration(
                        color: Color(0xFFBFBFBF),
                        shape: CircleBorder(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${remainingTime.inDays}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Gün",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 68,
                      height: 68,
                      decoration: ShapeDecoration(
                        color: Color(0xFFBFBFBF),
                        shape: CircleBorder(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${remainingTime.inHours.remainder(24)}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Saat",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 68,
                      height: 68,
                      decoration: ShapeDecoration(
                        color: Color(0xFFBFBFBF),
                        shape: CircleBorder(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${remainingTime.inMinutes.remainder(60)}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Dakika",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 68,
                      height: 68,
                      decoration: ShapeDecoration(
                        color: Color(0xFFBFBFBF),
                        shape: CircleBorder(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${remainingTime.inSeconds.remainder(60)}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Saniye",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}