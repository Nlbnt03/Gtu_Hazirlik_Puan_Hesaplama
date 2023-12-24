import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/last_menu.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/pro_girme_hak.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';

class pro_hesaplama extends StatefulWidget {
  const pro_hesaplama({Key? key}) : super(key: key);

  @override
  State<pro_hesaplama> createState() => _pro_hesaplamaState();
}

class _pro_hesaplamaState extends State<pro_hesaplama> {
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
    _ad!.load();
    _bannerAd!.load();
  }
  double son_ortalama(double donem1,double donem2){
    double donembir=(donem1*40)/100;
    double donemiki=(donem2*60)/100;
    double ortalama=donembir+donemiki;
    return ortalama;
  }
  bool tf1=false;
  bool tf2=false;
  var tfcontroller1 = TextEditingController();
  var tfcontroller2 = TextEditingController();
  double donem1=0;
  bool sonuc=false;
  double donem2=0;
  double ortalama=0;
  int new_ortalama=0;
  Future <bool> geridonustusu (BuildContext context) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lastMenu(),));
    return true;
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lastMenu(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("GTU Hazırlık Uygulaması"),
        centerTitle: true,
        backgroundColor: appbarRenk,
      ),
      backgroundColor: arkaPlan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isloaded ? Container(
              height: yukseklik/14.22,
              child: AdWidget(ad: _ad!),):SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                color: menuRenk,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1. Dönem Ortalama :",style: TextStyle(
                          color: Colors.white
                        )),
                        SizedBox(
                          width: genislik/4,
                          height: yukseklik/16,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: tfcontroller1,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("2. Dönem Ortalama :",style: TextStyle(
                              color: Colors.white
                            )),
                            SizedBox(
                              width: genislik/4,
                              height: yukseklik/16,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: tfcontroller2,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: genislik/4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: buttonRenk
                              ),
                              child: Text("Hesapla"),
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
                                  donem1=double.parse(tfcontroller1.text);
                                  donem2=double.parse(tfcontroller2.text);
                                  ortalama=son_ortalama(donem1, donem2);
                                  new_ortalama=ortalama.round();
                                  if(ortalama>=65){
                                    setState(() {
                                      sonuc=true;
                                    });
                                  }else{
                                    setState(() {
                                      sonuc=false;
                                    });
                                  }
                                  if(tf1==true && tf2==true){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => pro_girme_hak(sonuc, new_ortalama),));
                                  }else{
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("0-100 Arası Değer Girilmeli"),
                                    action: SnackBarAction(
                                      onPressed: (){
                                        if(tf1==false){
                                          tfcontroller1.clear();
                                        }
                                        if(tf2==false){
                                          tfcontroller2.clear();
                                        }
                                      },
                                      label: "Tekrar Deneyiniz",
                                    ),));
                                  }
                                  print(ortalama);
                                });

                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: genislik/4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: buttonRenk
                            ),
                            child: Text("Sıfırla"),
                            onPressed: (){
                              tfcontroller2.clear();
                              tfcontroller1.clear();
                            },
                          ),
                        ),
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
