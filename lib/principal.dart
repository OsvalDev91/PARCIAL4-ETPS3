import 'package:flutter/material.dart';
import 'package:parcial4etps/clientes.dart';
import 'package:parcial4etps/vuelos.dart';

class Principal extends StatelessWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MANTENIMIENTOS'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => Clientes(),)); },
              child: const Text('CLIENTES'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => Vuelos(),)); },
              child: const Text('VUELOS'),
            ),
          ],
        ),
      ),
    );
  }
}
