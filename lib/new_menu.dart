import 'package:flutter/material.dart';
import 'package:hazirlik_puan_hesaplama/final_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/girme_prof.dart';
import 'package:hazirlik_puan_hesaplama/hesaplama_ekrani.dart';
import 'package:hazirlik_puan_hesaplama/infoPage.dart';
import 'package:hazirlik_puan_hesaplama/pro_sinav_hesaplama.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse("https://www.instagram.com/yusuf.nlbnt03/?igshid=MzNlNGNkZWQ4Mg%3D%3D");
final Uri _url2= Uri.parse("https://www.linkedin.com/in/yusuf-eren-nalbant-0ba036256/");
final Uri _url3= Uri.parse("https://play.google.com/store/apps/developer?id=Nalbantsoft");

class menu2 extends StatefulWidget {
  const menu2({Key? key}) : super(key: key);

  @override
  State<menu2> createState() => _menu2State();
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
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}


class _menu2State extends State<menu2> with TickerProviderStateMixin {

  late AnimationController animasyonKontrol;
  late Animation< double> scaleAnimasyonDeger;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animasyonKontrol = AnimationController(
        vsync: this, duration: Duration(milliseconds: 250,));
    scaleAnimasyonDeger=Tween(begin: 0.0,end: 1.0).animate(animasyonKontrol)..addListener(() {setState(() {
    });});
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animasyonKontrol.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double genislik=ekranBilgisi.size.width;
    final double yukseklik=ekranBilgisi.size.height;
    bool fabDurum=false;
    return Scaffold(
      appBar: AppBar(
        title: Text("GTU Hazırlık Uygulaması"),
        centerTitle: true,
        backgroundColor: Color(0xff0D47A1),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => infoPage(),));}, icon: Icon(Icons.info_rounded,),iconSize: 33),
          )
        ],
      ),
      backgroundColor: Color(0xff0D47A1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25,bottom: 25),
              child: SizedBox(
                  width: genislik,
                  height: yukseklik/5.5,
                  child: Image.asset("resimler/gtulogox.png")
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => hesaplama_ekrani(),));
                  },
                  child: SizedBox(
                    width: genislik/3,
                    height: yukseklik/7,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color:Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon((Icons.calculate_outlined)),
                          ),
                          Text("Dönem Ortalaması Hesaplama",textAlign: TextAlign.center,style: TextStyle(fontSize: yukseklik/50,fontFamily: 'Monospace',),),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => pro_hesaplama(),));
                  },
                  child: SizedBox(
                    width: genislik/3,
                    height: yukseklik/7,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color:Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon((Icons.calculate_outlined)),
                          ),
                          Text("Proficiency Giriş Sorgulama",textAlign: TextAlign.center,style: TextStyle(
                              fontSize: yukseklik/55,
                              fontFamily: 'Monospace',
                          ),),
                          Text("(2.Dönem)",textAlign: TextAlign.center,style: TextStyle(
                            fontSize: yukseklik/70,
                            fontFamily: 'Monospace',
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => girme_prof(),));
                    },
                    child: SizedBox(
                      width: genislik/3,
                      height:yukseklik/7,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        color:Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon((Icons.calculate_outlined),),
                            ),
                            Text("Prof İçin 2.Dönem Final Notu",textAlign: TextAlign.center,style: TextStyle(
                              fontSize: yukseklik/50,
                              fontFamily: 'Monospace',
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => final_hesaplama(),));
                    },
                    child: SizedBox(
                      width: genislik/3,
                      height:yukseklik/7,
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        color:Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon((Icons.calculate_outlined),),
                            ),
                            Text("1. Dönem Final Hesaplama",textAlign: TextAlign.center,style: TextStyle(
                              fontSize: yukseklik/50,
                              fontFamily: 'Monospace'
                            )),
                          ],
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
                GestureDetector(
                  onTap: _launchUrl3,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: genislik/1.5,
                        height: yukseklik/5,
                        child: Image.asset("resimler/",)
                    ),
                  ),
                ),
              ],
            ),
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
                backgroundColor: Colors.white,
              ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Transform.scale(
              scale: scaleAnimasyonDeger.value,
              child:FloatingActionButton(
              onPressed: _launchUrl,
              elevation: 10,
              backgroundColor: Colors.white,
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
            backgroundColor: Color(0xfff49b0b),
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
