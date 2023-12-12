import 'package:flutter/material.dart';
import 'package:hazirlik_puan_hesaplama/final_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/girme_prof.dart';
import 'package:hazirlik_puan_hesaplama/hesaplama_ekrani.dart';
import 'package:hazirlik_puan_hesaplama/pro_sinav_hesaplama.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://www.instagram.com/yusuf.nlbnt03/');
final Uri _url2= Uri.parse("https://www.linkedin.com/in/yusuf-eren-nalbant-0ba036256/");

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}
Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw 'Could not launch $_url2';
  }
}
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double genislik=ekranBilgisi.size.width;
    final double yukseklik=ekranBilgisi.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("GTU Hazırlık Uygulaması"),
        centerTitle: true,
        backgroundColor: Color(0xff0D47A1),
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
                          Text("Dönem Ortalaması Hesaplama",textAlign: TextAlign.center,style: TextStyle(fontSize: yukseklik/50),),
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
                          Text("Proficiency Sınavına Girme Durumunu Hesaplama",textAlign: TextAlign.center,style: TextStyle(
                              fontSize: 12
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon((Icons.calculate_outlined),),
                            ),
                            Text("Profa girmek için finalden kaç almak lazım ?",textAlign: TextAlign.center,),
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon((Icons.calculate_outlined),),
                            ),
                            Text("Finalden Minimum Kaç Almam Lazım ?",textAlign: TextAlign.center,),
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
                  onTap: _launchUrl2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        width: genislik/1.5,
                        height: yukseklik/6,
                        child: Image.asset("resimler/Nalbantsoftx.png",)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchUrl,
        elevation: 10,
        backgroundColor: Colors.white,
        child: Image.asset("resimler/pngwing.com.png"),
      ),
    );
  }
}
