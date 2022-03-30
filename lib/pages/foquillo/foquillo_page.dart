import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_gds0351/pages/foquillo/foquillo_controller.dart';

class FoquilloPage extends StatefulWidget {
  const FoquilloPage({Key key}) : super(key: key);

  @override
  State<FoquilloPage> createState() => _FoquilloPageState();
}

class _FoquilloPageState extends State<FoquilloPage> {
  MapController _con = new MapController(); //Objeto controlador

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foco Page'),
        backgroundColor: Colors.black87
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _ledOn(),
            _ledOff(),
            _buttonSingout()
          ],
        
        ),
      ),
    );
  }

    Widget _bannerApp() {
    return ClipPath(
      clipper: MultipleRoundedCurveClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [Colors.redAccent, Colors.black87]),
        ),
        height: MediaQuery.of(context).size.height * 0.20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/foco.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Active el foco...',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Serif'),
            )
          ],
        ),
      ),
    );
  } //Terminar _bannerApp

  Widget _ledOn() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child:Image.asset('assets/img/ledOn.png' ), 
    );
  } //termina _textDescription

   Widget _ledOff() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child:Image.asset('assets/img/ledOff.png' ), 
    );
  } //termina _textDescription

 
 


  Widget _buttonSingout() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: _con.goToHomePage, //Método que ejecuta la acción rnt

        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Volver al inicio',
                    style: TextStyle(fontSize: 15),
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Align(
                alignment: Alignment.centerRight,
                
              ),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
      ),
    );
  } //termina _buttonLogin
}