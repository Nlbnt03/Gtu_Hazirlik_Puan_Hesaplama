import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/dateCounter.dart';
import 'package:hazirlik_puan_hesaplama/final_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/girme_prof.dart';
import 'package:hazirlik_puan_hesaplama/hesaplama_ekrani.dart';
import 'package:hazirlik_puan_hesaplama/infoPage.dart';
import 'package:hazirlik_puan_hesaplama/pro_sinav_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse("https://www.instagram.com/yusuf.nlbnt03/?igshid=MzNlNGNkZWQ4Mg%3D%3D");
final Uri _url2= Uri.parse("https://www.linkedin.com/in/yusuf-eren-nalbant-0ba036256/");
final Uri _url3= Uri.parse("https://play.google.com/store/apps/developer?id=Nalbantsoft");

class lastMenu extends StatefulWidget {
  const lastMenu({super.key});

  @override
  State<lastMenu> createState() => _lastMenuState();
}

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url2';
    }
  }
  Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw 'Could not launch $_url3';
  }
}


class _lastMenuState extends State<lastMenu> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late AnimationController animasyonKontrol2;
  late Animation <double> scaleAnimasyonDeger;
  late Animation<double> _leftButtonAnimation;
  late Animation<double> _rightButtonAnimation;
  late Animation<double> _bottomButtonAnimation;

  late InterstitialAd _interstitialAd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
    animasyonKontrol = AnimationController(
        vsync: this, duration: Duration(milliseconds: 250,));
    animasyonKontrol2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1250,));
    scaleAnimasyonDeger=Tween(begin: 0.0,end: 1.0).animate(animasyonKontrol)..addListener(() {setState(() {
    });});
    _leftButtonAnimation = Tween<double>(begin: -200, end: 0.0).animate(
      CurvedAnimation(
        parent: animasyonKontrol2,
        curve:  Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );
    _rightButtonAnimation = Tween<double>(begin: 200, end: 0).animate(
      CurvedAnimation(
        parent: animasyonKontrol2,
        curve: Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );
    _bottomButtonAnimation = Tween<double>(begin: 200,end: 0).animate(
      CurvedAnimation(parent: animasyonKontrol2, curve: Interval(0.5,1,curve: Curves.easeInOut)),
    );
    animasyonKontrol2.forward();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3400076691045068/9455944347',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          _interstitialAd.dispose();
          _createInterstitialAd();
        },
      ),
    );
  }

  void _showInterstitialAdAndNavigate() {
    _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => dateCounter()),
        );
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd.show();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _interstitialAd.dispose();
    super.dispose();
    animasyonKontrol.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double yukseklik = ekranBilgisi.size.height;
    double genislik = ekranBilgisi.size.width;
    bool fabDurum=false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:_showInterstitialAdAndNavigate,icon: Icon(Icons.date_range_outlined,color: buttonRenk,size: 33)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => infoPage(),));}, icon: Icon(Icons.info_outline_rounded,),iconSize: 33,color: buttonRenk,),
          )
        ],
        backgroundColor: appbarRenk,
        title: Text("GTU Hazırlık Uygulaması",style: TextStyle(
          color: arkaPlan,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Quicksand'
        ),),
        centerTitle: true,

      ),
      backgroundColor: arkaPlan,
      body: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            SizedBox(
                width: genislik,
                height: yukseklik/5.5,
                child: Image.asset("resimler/nalbant123.png")),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 12),
                child: Container(
                  width: genislik,
                  decoration: BoxDecoration(
                    color: menuRenk,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft:  Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 17.0),
                        child: Text("Hoş Geldiniz !",style: TextStyle(
                          color: arkaPlan,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => hesaplama_ekrani(),));
                              },
                              child: AnimatedBuilder(
                                animation: _leftButtonAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                  offset: Offset(_leftButtonAnimation.value,0.0),
                                  child: buttonum("Dönem Ortalama Hesaplama","resimler/calculater.png"),
                                  );
                                },
                              ),
                            ),GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => pro_hesaplama(),));
                              },
                              child: AnimatedBuilder(
                                animation: _rightButtonAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(_rightButtonAnimation.value,0.0),
                                    child: buttonum("Proficiency Giriş Sorgulama","resimler/sorgu.png"),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => girme_prof(),));
                              },
                              child: AnimatedBuilder(
                                animation: _leftButtonAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(_leftButtonAnimation.value,0.0),
                                    child: buttonum("Prof İçin 2.Dönem Final Notu","resimler/hesaplama.png"),
                                  );
                                },
                              ),
                            ),GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => final_hesaplama(),));
                              },
                              child: AnimatedBuilder(
                                animation: _rightButtonAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(_rightButtonAnimation.value,0.0),
                                    child: buttonum("1. Dönem Final Hesaplama","resimler/graphic.png"),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: ()
                            {
                              _launchUrl3();
                            },
                            child: AnimatedBuilder(
                              animation: _bottomButtonAnimation,
                              builder: (context, child) {
                                return Transform.translate(
                                    offset: Offset(0.0,_bottomButtonAnimation.value),
                                    child: SizedBox(
                                        width: genislik/1.5,
                                        height: yukseklik/5.2,
                                        child: Image.asset("resimler/Nalbantsoft.png")),
                                );
                              },
                            ),
                          ),
                        ]
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform.scale
            (
            scale: scaleAnimasyonDeger.value,
            child: FloatingActionButton(
              onPressed: _launchUrl2,
              child: Image.asset("resimler/linkedin.webp"),
              elevation: 10,
              backgroundColor: buttonRenk,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Transform.scale(
              scale: scaleAnimasyonDeger.value,
              child:FloatingActionButton(
                onPressed: _launchUrl,
                elevation: 10,
                backgroundColor: fabRenk,
                child: Image.asset("resimler/pngwing.com.png"),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: (){
              if(fabDurum){
                animasyonKontrol.reverse();
                fabDurum=false;
              }
              else{
                animasyonKontrol.forward();
                fabDurum=true;
              }
            },
            backgroundColor: appButtonRenk,
            child: Icon(Icons.add,color: menuRenk),
          )
        ],
      ),
    );
  }
}

class buttonum extends StatelessWidget {
  String icerik;
  String adres;


  buttonum(this.icerik, this.adres);

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    double yukseklik = ekranBilgisi.size.height;
    double genislik = ekranBilgisi.size.width;
    return Container(
      width: genislik/3,
      height: yukseklik/6.5,
      decoration: BoxDecoration(
        color: menuButton,
        borderRadius: BorderRadius.circular(15),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 45,
                height: 45,
                child: Image.asset(adres)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0,right: 5.0),
            child: Text(icerik,textAlign: TextAlign.center,style: TextStyle(
                fontSize: yukseklik/60,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.bold
            )),
          ),
        ],
      ),
    );
  }
}

