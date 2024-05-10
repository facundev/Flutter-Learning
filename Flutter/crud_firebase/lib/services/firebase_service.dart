import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople =
      db.collection('people'); // obtiene la coleccion

  QuerySnapshot queryPeople = await collectionReferencePeople
      .get(); // trae todos los documentos de la coleccion

  for (var documento in queryPeople.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "uid": documento.id,
    };
    people.add(person); // agrega a la lista -> name: "x"
  }

  return people;
}

// Guardar un name en base de datos
Future<void> addPeople(String name) async {
  await db.collection("people").add({"name": name});
}

// Actualizar un name en base de datos
Future<void> updatePeople(String uid, String newName) async {
  await db.collection("people").doc(uid).set({"name": newName});
}

// Eliminar datos en base de datos
Future<void> deletePeople(String uid) async {
  await db.collection("people").doc(uid).delete();
}
