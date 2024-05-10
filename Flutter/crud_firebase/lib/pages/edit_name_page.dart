import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments =
        ModalRoute.of(context)!.settings.arguments as Map; // Recibir argumentos
    nameController.text = arguments["name"]; // Mostrar nombre del argumento

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Modification',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updatePeople(arguments['uid'], nameController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Update"))
          ],
        ),
      ),
    );
  }
}
