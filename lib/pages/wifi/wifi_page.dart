import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_gds0351/pages/wifi/wifi_controller.dart';

class WifiPage extends StatefulWidget {
  const WifiPage({Key key}) : super(key: key);

  @override
  State<WifiPage> createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  WifiController _con = new WifiController(); //Objeto controlador

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
        title: Text('Wifi Page'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _conWifi(),
            _buttonLogin(),

          ],
        ),
      ),
    );
  } //termina build

  Widget _bannerApp() {
    return ClipPath(
      clipper: OvalLeftBorderClipper() ,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [Colors.lightGreenAccent, Colors.black87]),
        ),
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/wifi.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Conectate por wifi..',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Roboto'),
            )
          ],
        ),
      ),
    );
  } //Terminar _bannerApp

  Widget _conWifi() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child:Image.asset('assets/img/wifipanel.jpg',width: 400,height: 500 ), 
    );
  } //termina _textDescription


  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: _con.goToFoquilloPage, //Método que ejecuta la acción rnt

        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Establecer Conexión',
                    style: TextStyle(fontSize: 18),
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  child: Icon(Icons.wifi),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  radius: 25,
                ),
              ),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
      ),
    );
  } //termina _buttonLogin

  
}
  
