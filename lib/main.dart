import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hazirlik_puan_hesaplama/final_hesaplama.dart';
import 'package:hazirlik_puan_hesaplama/hesaplama_ekrani.dart';
import 'package:hazirlik_puan_hesaplama/menu.dart';
import 'package:hazirlik_puan_hesaplama/new_menu.dart';
import 'package:hazirlik_puan_hesaplama/pro_sinav_hesaplama.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  MobileAds.instance.initialize();
  runApp(const MyApp());
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool progressGorun=false;
  @override
  void initState() {
    super.initState();
    setState(() {
      progressGorun=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double yukseklik=ekranBilgisi.size.height;
    final double genislik=ekranBilgisi.size.width;
    return AnimatedSplashScreen(
      nextScreen: menu2(),
      splash: Lottie.asset("resimler/kelebex.json"),
      backgroundColor: Color(0xff0D47A1),
      splashIconSize:genislik,
      duration: 1600,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      animationDuration: const Duration(seconds: 1),



    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GTU Hazırlık Puan Hesaplama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Color(0xff0D47A1),
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
