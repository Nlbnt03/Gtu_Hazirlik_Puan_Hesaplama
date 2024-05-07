import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/last_menu.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';
import 'package:hazirlik_puan_hesaplama/sonuc_ekrani.dart';
import 'dart:math';

class hesaplama_ekrani extends StatefulWidget {
  const hesaplama_ekrani({Key? key}) : super(key: key);

  @override
  State<hesaplama_ekrani> createState() => _hesaplama_ekraniState();
}

class _hesaplama_ekraniState extends State<hesaplama_ekrani> {
  bool isloaded=false;
  BannerAd? _bannerAd;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bannerAd=BannerAd(
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isloaded=true;
          });
          print("reklam yüklendi");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: AdRequest(),
      adUnitId: "ca-app-pub-3400076691045068/9624099145",
    );
    _bannerAd!.load();
  }
  bool tf1=false;
  bool tf2=false;
  bool tf3=false;
  bool tf4=false;
  bool tf5=false;
  bool tf6=false;
  bool tf7=false;
  bool tf8=false;
  bool sonuc=false;
  double sonuc_vize=0;
  double sonuc_reading=0;
  double sonuc_speaking=0;
  double sonuc_final=0;
  double sonuc_video=0;
  double vize_hesap(double vize1,double vize2){
    double sonuc=(((vize1+vize2)/2)*30)/100;
    return sonuc;
  }
  double reading_hesapla(double reading1, double reading2){
    double sonuc=((reading1+reading2)/2)*10/100;
    return sonuc;
  }
  double speaking_hesapla(double speaking1){
    double sonuc=((speaking1))*10/100;
    return sonuc;
  }
  double final_hesapla(double finalN){
    double sonuc=(finalN*40)/100;
    return sonuc;
  }
  double poster_sunumu(double video){
    double sonuc=(video*10)/100;
    return sonuc;
  }
  var tfcontroller1=TextEditingController();
  var tfcontroller2=TextEditingController();
  var tfcontroller3=TextEditingController();
  var tfcontroller4=TextEditingController();
  var tfcontroller5=TextEditingController();
  var tfcontroller6=TextEditingController();
  var tfcontroller7=TextEditingController();
  var tfcontroller8=TextEditingController();
  double vize1=0;
  double vize2=0;
  double reading1=0;
  double reading2=0;
  double speaking1=0;
  double speaking2=0;
  double finalN=0;
  double video=0;
  int ortalama =0;
  @override
  Future <bool> geridonustusu3 (BuildContext context) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lastMenu(),));
    return true;
  }
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double yukseklik=ekranBilgisi.size.height;
    final double genislik=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lastMenu(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("GTU Hazırlık Uygulaması",style: TextStyle(color: yaziRenk,fontFamily: "Quicksand",fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: appbarRenk,
      ),
      backgroundColor: arkaPlan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: menuRenk,
                elevation: 10,
                shadowColor: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. Vize :",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller1,
                                decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. Vize :",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller2,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("1. Reading :",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2. Reading :",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller4,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Speaking :",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                   /* Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Speaking :",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller6,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Final :",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                          SizedBox(
                            width: genislik/4,
                            height: yukseklik/20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: tfcontroller7,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Poster Sunumu :",style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                        SizedBox(
                          width: genislik/4,
                          height: yukseklik/20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: tfcontroller8,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: genislik/3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: buttonRenk
                              ),
                              child: Text("HESAPLA",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14
                              ),),
                              onPressed: (){
                                setState(() {
                                  if(double.parse(tfcontroller1.text)>100 || double.parse(tfcontroller1.text)<0){
                                    tf1=false;
                                  }else{
                                    tf1=true;
                                  }
                                  if(double.parse(tfcontroller2.text)>100 || double.parse(tfcontroller2.text)<0){
                                    tf2=false;
                                  }else{
                                    tf2=true;
                                  }
                                  if(double.parse(tfcontroller3.text)>100 || double.parse(tfcontroller3.text)<0){
                                    tf3=false;
                                  }else{
                                    tf3=true;
                                  }
                                  if(double.parse(tfcontroller4.text)>100 || double.parse(tfcontroller4.text)<0){
                                    tf4=false;
                                  }else{
                                    tf4=true;
                                  }
                                  if(double.parse(tfcontroller5.text)>100 || double.parse(tfcontroller5.text)<0){
                                    tf5=false;
                                  }else{
                                    tf5=true;
                                  }
                                  /*if(double.parse(tfcontroller6.text)>100 || double.parse(tfcontroller6.text)<0){
                                    tf6=false;
                                  }else{
                                    tf6=true;
                                  }*/
                                  if(double.parse(tfcontroller7.text)>100 || double.parse(tfcontroller7.text)<0){
                                    tf7=false;
                                  }else{
                                    tf7=true;
                                  }
                                  if(double.parse(tfcontroller8.text)>100 || double.parse(tfcontroller8.text)<0){
                                    tf8=false;
                                  }else{
                                    tf8=true;
                                  }
                                  vize1=double.parse(tfcontroller1.text);
                                  vize2=double.parse(tfcontroller2.text);
                                  sonuc_vize=vize_hesap(vize1, vize2);
                                  reading1=double.parse(tfcontroller3.text);
                                  reading2=double.parse(tfcontroller4.text);
                                  sonuc_reading=reading_hesapla(reading1, reading2);
                                  speaking1=double.parse(tfcontroller5.text);
                                  //speaking2=double.parse(tfcontroller6.text);
                                  sonuc_speaking=speaking_hesapla(speaking1);
                                  finalN=double.parse(tfcontroller7.text);
                                  sonuc_final=final_hesapla(finalN);
                                  video=double.parse(tfcontroller8.text);
                                  sonuc_video=poster_sunumu(video);
                                  ortalama=(sonuc_video+sonuc_final+sonuc_speaking+sonuc_reading+sonuc_vize).round();
                                  print(ortalama);
                                  if(ortalama>=65){
                                    sonuc=true;
                                  }
                                  else{
                                    sonuc=false;
                                  }
                                  if(tf1==true && tf2==true  && tf3==true  && tf4==true  && tf5==true  && tf8==true  && tf7==true){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonuc_ekrani(sonuc,ortalama),));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("0-100 Arası değer girilmeli")
                                    ,action: SnackBarAction(label: "Tekrar Deneyiniz",
                                      onPressed: (){
                                        if(tf1==false){
                                          tfcontroller1.clear();
                                        }
                                        if(tf2==false){
                                          tfcontroller2.clear();
                                        }
                                        if(tf3==false){
                                          tfcontroller3.clear();
                                        }
                                        if(tf4==false){
                                          tfcontroller4.clear();
                                        }
                                        if(tf5==false){
                                          tfcontroller5.clear();
                                        }
                                        /*if(tf6==false){
                                          tfcontroller6.clear();
                                        }*/
                                        if(tf7==false){
                                          tfcontroller7.clear();
                                        }
                                        if(tf8==false){
                                          tfcontroller8.clear();
                                        }

                                      }),));
                                  }
                                });

                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: genislik/3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonRenk,
                            ),
                            onPressed: (){
                              tfcontroller8.clear();
                              tfcontroller7.clear();
                              //tfcontroller6.clear();
                              tfcontroller5.clear();
                              tfcontroller4.clear();
                              tfcontroller3.clear();
                              tfcontroller2.clear();
                              tfcontroller1.clear();
                            },
                            child: Text("Sıfırla",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isloaded ? Container(
              height: yukseklik/14.22,
              child: AdWidget(ad: _bannerAd!),):SizedBox()
          ],
        ),
      ),

    );
  }
}
