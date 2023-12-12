import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
class girme_prof extends StatefulWidget {
  const girme_prof({Key? key}) : super(key: key);

  @override
  State<girme_prof> createState() => _girme_profState();
}

class _girme_profState extends State<girme_prof> {
  var tf1=TextEditingController();
  var tf2=TextEditingController();
  var tf3=TextEditingController();
  var tf4=TextEditingController();
  var tf5=TextEditingController();
  var tf6=TextEditingController();
  //var tf7=TextEditingController();
  var tf8=TextEditingController();

  var formkey=GlobalKey<FormState>();
  var formkey2=GlobalKey<FormState>();
  var formkey3=GlobalKey<FormState>();
  var formkey4=GlobalKey<FormState>();
  var formkey5=GlobalKey<FormState>();
  var formkey6=GlobalKey<FormState>();
  //var formkey7=GlobalKey<FormState>();
  var formkey8=GlobalKey<FormState>();

  double ortalama_donem1=0;
  double vize1=0;
  double vize2=0;
  double read1=0;
  double read2=0;
  double speak1=0;
  double speak2=0;
  double sunum=0;
  double final_not=0;
  double gecici_not=0;
  String format="";

  double vize_sonuc=0;
  double read_sonuc=0;
  double speak_sonuc=0;
  double sunum_sonuc=0;

  double vize_hesap(double vize1,double vize2){
    double sonuc=(((vize1+vize2)/2)*30)/100;
    return sonuc;
  }
  double reading_hesapla(double reading1, double reading2){
    double sonuc=((reading1+reading2)/2)*10/100;
    return sonuc;
  }
  double speaking_hesapla(double speaking1){
    double sonuc=((speaking1))*5/100;
    return sonuc;
  }

  double sunum_hesapla(double sunum){
    double sonuc=(sunum*10)/100;
    return sonuc;
  }
  bool isloaded= false;
  BannerAd? _bannerAd;
  BannerAd? _ad;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bannerAd=BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3400076691045068/9624099145",
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
        request: AdRequest());
    _ad=BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3400076691045068/9624099145",
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
        request: AdRequest());
    _bannerAd!.load();
    _ad!.load();
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double yukseklik=ekranBilgisi.size.height;
    final double genislik=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => menu2(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("GTU Hazırlık Uygulaması"),
        centerTitle: true,
        backgroundColor: Color(0xff0D47A1),
      ),
      backgroundColor: Color(0xff0D47A1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isloaded ? Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 10),
                child: Container(
                  height: yukseklik/14.22,
                  child: AdWidget(ad: _bannerAd!),),
              ):SizedBox(),
              Padding(
                padding: isloaded?  EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 100.0),
                child: Container(
                    height: yukseklik*0.60,
                    width: genislik*0.85,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0,2),
                            blurRadius: 10.0
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Gerekli Not : ${format}",style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1.Dönem Ortalama :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey2,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf1,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1.Vize :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı";
                                      }
                                      return null;
                                    },
                                    controller: tf2,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2.Vize :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey3,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı";
                                      }
                                      return null;
                                    },
                                    controller: tf3,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1. Reading :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey4,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf4,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2.Reading :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey5,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf5,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Speaking :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey6,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf6,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2.Speaking :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey7,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf7,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sunum :  ",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            )),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Form(
                                key: formkey8,
                                child: SizedBox(
                                  width: genislik/4,
                                  height: yukseklik/25,
                                  child: TextFormField(
                                    validator: (tfgirdisi){
                                      if(tfgirdisi!.isEmpty){
                                        return "Not Giriniz";
                                      }
                                      final number = double.tryParse(tfgirdisi);
                                      if(number!>100 || number!<0){
                                        return "0-100 olmalı ";
                                      }
                                      return null;
                                    },
                                    controller: tf8,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      fillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                                    onPressed:(){
                                      bool kontrol_sonuc=formkey.currentState!.validate();
                                      bool kontrol_sonuc2=formkey2.currentState!.validate();
                                      bool kontrol_sonuc3=formkey3.currentState!.validate();
                                      bool kontrol_sonuc4=formkey4.currentState!.validate();
                                      bool kontrol_sonuc5=formkey5.currentState!.validate();
                                      bool kontrol_sonuc6=formkey6.currentState!.validate();
                                      //bool kontrol_sonuc7=formkey7.currentState!.validate();
                                      bool kontrol_sonuc8=formkey8.currentState!.validate();

                                      if(kontrol_sonuc && kontrol_sonuc2 && kontrol_sonuc3 && kontrol_sonuc4 && kontrol_sonuc5 && kontrol_sonuc6
                                           && kontrol_sonuc8){
                                        setState(() {
                                          ortalama_donem1=double.parse(tf1.text);
                                          vize1=double.parse(tf2.text);
                                          vize2=double.parse(tf3.text);
                                          read1=double.parse(tf4.text);
                                          read2=double.parse(tf5.text);
                                          speak1=double.parse(tf6.text);
                                          //speak2=double.parse(tf7.text);
                                          sunum=double.parse(tf8.text);
                                          vize_sonuc=vize_hesap(vize1, vize2);
                                          read_sonuc=reading_hesapla(read1,read2);
                                          speak_sonuc=speaking_hesapla(speak1);
                                          sunum_sonuc=sunum_hesapla(sunum);
                                          gecici_not=65-(ortalama_donem1*40/100);
                                          final_not=(100/24)*(gecici_not-0.6*vize_sonuc-0.6*read_sonuc-0.6*speak_sonuc-0.6*sunum_sonuc);
                                          format=final_not.toStringAsFixed(2);
                                        });
                                      }
                                    },
                                    child: Text("Hesapla"),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: genislik/3,
                              child: ElevatedButton(
                                  onPressed:(){
                                    tf1.clear();
                                    tf2.clear();
                                    tf3.clear();
                                    tf4.clear();
                                    tf5.clear();
                                    tf6.clear();
                                    //tf7.clear();
                                    tf8.clear();
                                  },
                                  child: Text("Sıfırla"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  )),
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),
              isloaded ? Container(
                height: yukseklik/14.22,
                child: AdWidget(ad: _ad!),):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
