import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Vuelos extends StatefulWidget {
  const Vuelos({super.key});

  @override
  State<Vuelos> createState() => _VuelosState();
}

class _VuelosState extends State<Vuelos> {
  // text fields' controllers
  final TextEditingController _idvueloController = TextEditingController();
  final TextEditingController _disponibilidadController = TextEditingController();
  final TextEditingController _tipoVueloController = TextEditingController();
  final TextEditingController _avionIdController = TextEditingController();
  final TextEditingController _destinoIdController = TextEditingController();

  final CollectionReference _vuelos =
  FirebaseFirestore.instance.collection('vuelos');
//insertar producto
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _idvueloController,
                  decoration: const InputDecoration(labelText: 'idvuelo'),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _disponibilidadController,
                  decoration: const InputDecoration(labelText: 'disponibilidad',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _tipoVueloController,
                  decoration: const InputDecoration(labelText: 'tipoVuelo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _avionIdController,
                  decoration: const InputDecoration(labelText: 'avionId',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _destinoIdController,
                  decoration: const InputDecoration(labelText: 'destinoId',),
                ),


                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),

                  onPressed: () async {
                    final String idvuelo = _idvueloController.text;
                    final String disponibilidad = _disponibilidadController.text;
                    final String tipoVuelo = _tipoVueloController.text;
                    final String avionId = _avionIdController.text;
                    final String destinoId = _destinoIdController.text;

                    if (idvuelo != null) {
                      await _vuelos
                          .add({"idvuelo": idvuelo, "disponibilidad": disponibilidad, "tipoVuelo": tipoVuelo,
                        "avionId": avionId, "destinoId": destinoId});

                      _idvueloController.text = "";
                      _disponibilidadController.text = "";
                      _tipoVueloController.text = "";
                      _avionIdController.text = "";
                      _destinoIdController.text = "";

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
//actualizar poducto

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _idvueloController.text = documentSnapshot['idvuelo'].toString();
      _disponibilidadController.text = documentSnapshot['disponibilidad'].toString();
      _tipoVueloController.text = documentSnapshot['tipoVuelo'].toString();
      _avionIdController.text = documentSnapshot['avionId'].toString();
      _destinoIdController.text = documentSnapshot['destinoId'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TextField(
                  controller: _idvueloController,
                  decoration: const InputDecoration(labelText: 'idvuelo'),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _disponibilidadController,
                  decoration: const InputDecoration(labelText: 'disponibilidad',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _tipoVueloController,
                  decoration: const InputDecoration(labelText: 'tipoVuelo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _avionIdController,
                  decoration: const InputDecoration(labelText: 'avionId',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _destinoIdController,
                  decoration: const InputDecoration(labelText: 'destinoId',),
                ),

                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {

                    final String idvuelo = _idvueloController.text;
                    final String disponibilidad = _disponibilidadController.text;
                    final String tipoVuelo = _tipoVueloController.text;
                    final String avionId = _avionIdController.text;
                    final String destinoId = _destinoIdController.text;


                    if (idvuelo != null) {
                      await _vuelos
                          .doc(documentSnapshot!.id)
                          .update({"idvuelo": idvuelo, "disponibilidad": disponibilidad, "tipoVuelo": tipoVuelo,
                        "avionId": avionId, "destinoId": destinoId});

                      _idvueloController.text = "";
                      _disponibilidadController.text = "";
                      _tipoVueloController.text = "";
                      _avionIdController.text = "";
                      _destinoIdController.text = "";

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

//borrar productos
  Future<void> _delete(String idvuelos) async {
    await _vuelos.doc(idvuelos).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El vuelo fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('TABLA VUELOS')),
        ),
        body: StreamBuilder(
          stream: _vuelos.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(

                      title: Text(documentSnapshot['tipoVuelo'].toString()),
                      /*subtitle: Text(documentSnapshot['precio'].toString()),*/

                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// agregar productos
        floatingActionButton: FloatingActionButton(

          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

