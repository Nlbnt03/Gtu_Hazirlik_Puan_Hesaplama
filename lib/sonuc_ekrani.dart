import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/hesaplama_ekrani.dart';
import 'package:hazirlik_puan_hesaplama/last_menu.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';

class sonuc_ekrani extends StatefulWidget {
  bool sonuc;
  int ortalama;

  sonuc_ekrani(this.sonuc, this.ortalama);

  @override
  State<sonuc_ekrani> createState() => _sonuc_ekraniState();
}

class _sonuc_ekraniState extends State<sonuc_ekrani> {
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
  Future <bool> geridonustusu (BuildContext context) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => hesaplama_ekrani(),));
    return true;
  }
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Bilgilendirme !",style: TextStyle(
              color: Color(0xffF00000),
              fontWeight: FontWeight.bold
          ),),
          content: SizedBox(
            width: 80,
            height: 80,
            child: Column(
              children: [
                Text("Yapılan hesaplamalara göre ortalamanız ${widget.ortalama} ve Ocak ayında yapılacak olan Proficiency sınavına girebilirsiniz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16
                ),)
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: (){Navigator.pop(context);},
                child:Text("Tamam",style: TextStyle(
                    color: Color(0xffF00000),
                    fontWeight: FontWeight.bold
                ),)
            ),
          ],
        );
      },);
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
        if(widget.ortalama >= 65) {
          _showAlertDialog();
        }
        });
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double genislik=ekranBilgisi.size.width;
    final double yukseklik=ekranBilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => hesaplama_ekrani(),));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("GTU Hazırlık Uygulaması",style: TextStyle(color: yaziRenk,fontFamily: "Quicksand",fontWeight: FontWeight.bold)),
        backgroundColor: appbarRenk,
        centerTitle: true,
      ),
      backgroundColor: menuRenk,
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
               height: yukseklik/2,
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
                         child: Text(widget.sonuc ? "Geçtiniz" : "Repeat",
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
                                primary: appbarRenk
                              ),
                               onPressed:(){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => hesaplama_ekrani(),));
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
