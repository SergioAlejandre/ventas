import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ventas/Vistas/calendario_view.dart';
import 'package:ventas/modelos/producto_modelo.dart';
import 'package:ventas/widgets/CustomButtonHome.dart';
import 'dart:async';
import 'package:intl/intl.dart';

Stream<DateTime> clockStream() {
  return Stream<DateTime>.periodic(Duration(seconds: 1), (_) {
    return DateTime.now();
  });
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 26, 26),
      appBar: AppBar(
        title: const DefaultTextStyle(
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          child: Text('Lógo de estética'),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StreamBuilder<DateTime>(
                stream: clockStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String formattedTime =
                        DateFormat('hh:mm:ss').format(snapshot.data!);
                    return Text(
                      'Reloj: $formattedTime',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 253, 253),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              const SizedBox(
                height: 40,
                child: Text(
                  'Cita Actual',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              //-------------------NO SERA CONSTANTE--------------------
              const SizedBox(
                height: 70,
                width: 200,
                child: Column(
                  children: <Widget>[
                    Text('Laura Martinez'),
                   ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 40,
                child: Text(
                  'Proximamente',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 253, 253),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              //-------------------NO SERA CONSTANTE--------------------
              const SizedBox(
                height: 70,
                width: 200,
                child: Column(
                  children: <Widget>[
                    Text('Julisa Mendez'),
                    Text('Jacquelinee Baltierrez'),
                    Text('Michelle Rodriguez'),
                    
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomButtonHome(
                name: 'Agendar Cita',
                color: Color.fromARGB(249, 102, 3, 3),
                onPressed: () {
                  /*Navigator.push(
                  context,
                 MaterialPageRoute(
                    builder: (context) {
                     return AgregarProductosView(
                      productos: productos,
                     );
                    },
                  ),
                );*/
                },
              ),
              const SizedBox(height: 20),
              CustomButtonHome(
                name: 'Ver calendario de citas',
                color: const Color.fromARGB(249, 102, 3, 3),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CalendarioView(
                       
                     );
                    },
                  ),
                );
                },
              ),
              const SizedBox(height: 20),
              /*CustomButtonHome(
                name: 'Realizar cobro',
                color: const Color.fromARGB(255, 3, 253, 220),
                onPressed: () {
                  /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CompraDeProductosView(
                      // productos: productos,
                     );
                    },
                  ),
                );*/
                },
              ),*/

              /*CustomButtonHome(
              name: 'Test Hive',
              color: Colors.blue,
              onPressed: () {
               var productosBox = Hive.box('productos');
                print('Productos: ${productosBox.values}');
              },
            ),*/
              /* CustomButtonHome(
              name: 'Productos Comprados',
              color: const Color.fromARGB(255, 160, 108, 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductosCompradosView(),
                  ),
                );
              },
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}
