import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_gds0351/pages/blue/blue_controller.dart';

class BluePage extends StatefulWidget {
  const BluePage({Key key}) : super(key: key);

  @override
  State<BluePage> createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  BlueController _con = new BlueController(); //Objeto controlador

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
        title: Text('Bluetooth Page'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _conBlue(),
            _buttonLogin(),
     
          ],
        ),
      ),
    );
  } //termina build

  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperOne() ,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: const [Colors.lightBlue, Colors.black87]),
        ),
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/img/blue.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Conectate por Bluetooth..',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: 'Roboto'),
            )
          ],
        ),
      ),
    );
  } //Terminar _bannerApp

   Widget _conBlue() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child:Image.asset('assets/img/bluepanel.jpg' ), 
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
                  child: Icon(Icons.bluetooth_connected_outlined),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  radius: 25,
                ),
              ),
            )
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
      ),
    );
  } 

  
}
  
