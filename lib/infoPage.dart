import 'package:flutter/material.dart';
import 'package:hazirlik_puan_hesaplama/last_menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/renkler.dart';

class infoPage extends StatefulWidget {
  const infoPage({super.key});

  @override
  State<infoPage> createState() => _infoPageState();
}
Future <bool> geridonustusu2 (BuildContext context) async{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lastMenu(),));
  return true;
}
class _infoPageState extends State<infoPage> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double yukseklik=ekranBilgisi.size.height;
    final double genislik=ekranBilgisi.size.width;
    final String text1= "";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context) => lastMenu(),));
          },
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        title: Text("Bilgilendirme Sayfası",style: TextStyle(color: yaziRenk,fontFamily: 'Quicksand'),),
        backgroundColor: appbarRenk,
        centerTitle: true,
      ),
      backgroundColor: arkaPlan,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: yukseklik/2.5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text:  "- Merhaba, ben Yusuf Nalbant, Gebze Teknik Üniversitesi Hazırlık Programı uygulamasının geliştiricisiyim. Bu uygulama, hazırlık okuyan öğrenciler için çeşitli hesaplama seçenekleri sunmaktadır.İşte bu seçenekler:\n\n",
                            style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "1-)Dönem Ortalama Hesaplama:",
                                style: TextStyle(color: Color(0xffF00000),fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: " Mevcut dönem notlarınızdan dönem ortalamasını hesaplayın.\n\n",
                                  style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16),
                              ),
                              TextSpan(
                                  text: "2-)Haziran Ayındaki Proficiency Sınavına Giriş Sorgulama:",
                                  style: TextStyle(color: Color(0xffF00000),fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: " Haziran ayındaki Proficiency sınavına giriş şartlarını kontrol edin.\n\n",
                                  style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: "3-)Haziran Ayındaki Proficiency Sınavına Girebilmek İçin Minimum Final Notu:",
                                  style: TextStyle(color: Color(0xffF00000),fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: " Proficiency sınavına girebilmek için 2. dönem final notunuzun minimum kaç olması gerektiğini öğrenin.\n\n",
                                  style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: "4-)1. Dönemi 65 Ortalama ile Bitirebilmek İçin Minimum Final Notu:",
                                  style: TextStyle(color: Color(0xffF00000),fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: " 1. dönemi 65 ortalama ile tamamlayabilmek için finalden minimum kaç almanız gerektiğini hesaplayın.\n\n",
                                  style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                              TextSpan(
                                  text: "Uygulama ile ilgili geri bildirimde bulunmak için menüde sağ alt kısımda bulunan buton üzerinden sosyal medya hesaplarıma ulaşabilirsiniz. Her türlü soru ve önerilere açığım. İyi çalışmalar!",
                                  style: TextStyle(color: Colors.white,fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 16)
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: menuRenk,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
