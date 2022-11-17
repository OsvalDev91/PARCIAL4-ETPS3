import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4etps/principal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirebaseAPP());
}

class FirebaseAPP extends StatelessWidget {
  const FirebaseAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PARCIAL4 ETPS3',
      home: Principal(),
    );
  }
}

/*class PrimeraPantalla extends StatelessWidget {
  const PrimeraPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('TABLA CLIENTES'),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Principal(), ));},
        ),
      ),
    );
  }
}*/
