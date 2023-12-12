import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/final_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';

class final_sonuc extends StatefulWidget {
  int sonuc;
  bool durum;


  final_sonuc(this.sonuc, this.durum);

  @override
  State<final_sonuc> createState() => _final_sonucState();
}

class _final_sonucState extends State<final_sonuc> {
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
    var ekranBilgisi = MediaQuery.of(context);
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
      backgroundColor:Color(0xff0D47A1) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isloaded ? Container(
              height: yukseklik/14.22,
              child: AdWidget(ad: _ad!),):SizedBox(),
            SizedBox(
              width: 300,
              height: 250,
              child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Minimum Almanız Gereken Not",style: TextStyle(
                      fontSize: 30,
                    ),textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:widget.durum? Text("${widget.sonuc}",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),):Text("Sen Kaldın",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),)
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      child: Text("Tekrar Hesapla"),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => final_hesaplama(),));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("< DEVELOPED BY NALBANTSOFT >",style: TextStyle(fontWeight: FontWeight.bold),),
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
