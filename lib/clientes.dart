import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  // text fields' controllers
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _idreservasController = TextEditingController();

  final CollectionReference _clientes =
  FirebaseFirestore.instance.collection('clientes');
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
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'cedula'),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'nombre',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'apellido',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _fechaController,
                  decoration: const InputDecoration(labelText: 'fecha_nacimiento',
                  ),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'sexo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'tipo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'usuario',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _idreservasController,
                  decoration: const InputDecoration(labelText: 'idreservas',),
                ),


                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),

                  onPressed: () async {
                    final String cedula = _cedulaController.text;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fecha_nacimiento = _fechaController.text;
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    final String idreservas = _idreservasController.text;

                    if (cedula != null) {
                      await _clientes
                          .add({"cedula": cedula, "nombre": nombre, "apellido": apellido, "fecha_nacimiento": fecha_nacimiento,
                        "sexo": sexo, "tipo": tipo, "usuario": usuario, "idreservas": idreservas,});

                      _cedulaController.text = "";
                      _nombreController.text = "";
                      _apellidoController.text = "";
                      _fechaController.text = "";
                      _sexoController.text = "";
                      _tipoController.text = "";
                      _usuarioController.text = "";
                      _idreservasController.text = "";

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
      _cedulaController.text = documentSnapshot['cedula'].toString();
      _nombreController.text = documentSnapshot['nombre'].toString();
      _apellidoController.text = documentSnapshot['apellido'].toString();
      _fechaController.text = documentSnapshot['fecha_nacimiento'].toString();
      _sexoController.text = documentSnapshot['sexo'].toString();
      _tipoController.text = documentSnapshot['tipo'].toString();
      _usuarioController.text = documentSnapshot['usuario'].toString();
      _idreservasController.text = documentSnapshot['idreservas'].toString();
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
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'cedula'),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'nombre',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'apellido',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _fechaController,
                  decoration: const InputDecoration(labelText: 'fecha_nacimiento',
                  ),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'sexo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'tipo',),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'usuario',),
                ),

                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _idreservasController,
                  decoration: const InputDecoration(labelText: 'idreservas',),
                ),

                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {

                    final String cedula = _cedulaController.text;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fecha_nacimiento = _fechaController.text;
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    final String idreservas = _idreservasController.text;


                    if (cedula != null) {
                      await _clientes
                          .doc(documentSnapshot!.id)
                          .update({"cedula": cedula, "nombre": nombre, "apellido": apellido, "fecha_nacimiento": fecha_nacimiento,
                        "sexo": sexo, "tipo": tipo, "usuario": usuario, "idreservas": idreservas,});

                      _cedulaController.text = '';
                      _nombreController.text = '';
                      _apellidoController.text = '';
                      _fechaController.text = '';
                      _sexoController.text = '';
                      _tipoController.text = '';
                      _usuarioController.text = '';
                      _idreservasController.text = '';

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
  Future<void> _delete(String idreservas) async {
    await _clientes.doc(idreservas).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El producto fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('TABLA CLIENTES')),
        ),
        body: StreamBuilder(
          stream: _clientes.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(

                      title: Text(documentSnapshot['nombre'].toString()),
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

