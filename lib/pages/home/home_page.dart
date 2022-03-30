import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_gds0351/pages/home/home_controller.dart';

class HomePage extends StatelessWidget {
  //Instancia del controlador
  HomeController _con = new HomeController();

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _con.init(context); //Ejecutar constructor con el contexto
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [
                  Color.fromARGB(222, 241, 178, 304),
                  Colors.greenAccent
                ]),
          ),
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/img/wiblu.png',
                        width: 150,
                        height: 100,
                      ),
                      Text(
                        'WIFI-BLUETOOTH',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 35,
                            fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'SELECCIONA EL MODO DE CONEXIÓN',
                style: TextStyle(color: Colors.black)
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: _con.goToWifiPage, //método que maneja el evento
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/wifi.png'),
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
              Text(
                'WIFI',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _con.goToBluePage,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/blue.png'),
                  radius: 50,
                  backgroundColor: Colors.black,
                ),
              ),
              Text(
                'BLUETOOTH',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  } //Método build

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }
} //Clase HomePage
