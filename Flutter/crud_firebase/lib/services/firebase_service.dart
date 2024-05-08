import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople =
      db.collection('people'); // obtiene la coleccion

  QuerySnapshot queryPeople = await collectionReferencePeople
      .get(); // trae todos los documentos de la coleccion

  queryPeople.docs.forEach((documento) {
    people.add(documento.data()); // agrega a la lista name: "x"
  });

  return people;
}
