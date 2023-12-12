import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/pro_sinav_hesaplama.dart';

class pro_girme_hak extends StatefulWidget {
  bool sonuc;
  int ortalama;

  pro_girme_hak(this.sonuc, this.ortalama);

  @override
  State<pro_girme_hak> createState() => _pro_girme_hakState();
}

class _pro_girme_hakState extends State<pro_girme_hak> {
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
  Future <bool> geridonustusu (BuildContext context) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => pro_hesaplama(),));
    return true;
  }
  @override
  Widget build(BuildContext context) {
    bool tf1=false;
    bool tf2=false;
    var ekranBilgisi= MediaQuery.of(context);
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
      body: WillPopScope(
        onWillPop: () => geridonustusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isloaded ? Container(
                height: yukseklik/14.22,
                child: AdWidget(ad: _ad!),):SizedBox(),
              SizedBox(
                width: genislik*3/4,
                height: yukseklik*9/16,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox
                          (width: genislik/2,
                            height: yukseklik/4,
                            child: Image.asset(widget.sonuc ? "resimler/happy.webp" : "resimler/sad.webp")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.sonuc ? "Girebilirsiniz" : "Giremezsiniz",
                              style: TextStyle(
                                color: widget.sonuc ? Colors.green : Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Text("Ortalamanız : ${widget.ortalama}",style: TextStyle(
                          color: widget.sonuc ? Colors.green : Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: genislik/2,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black
                                ),
                                onPressed:(){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => pro_hesaplama(),));
                                },
                                child: Text("Tekrar Hesapla",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          ),
                        ),
                        Text("< DEVELOPED BY NALBANTSOFT >",style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
              isloaded ? Container(
                height: yukseklik/14.22,
                child: AdWidget(ad: _bannerAd!),):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
