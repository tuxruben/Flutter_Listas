import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> _personas = [
    Persona("Jose", "Galdamez", "+504 3157-1499"),
    Persona("Martin", "Garcia", "+504 3154-8975"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView.builder(
            itemCount: _personas.length,
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  this._borrarPersona(context, _personas[index]);
                },
                title: Text(
                    _personas[index].name + ' ' + _personas[index].lastname),
                subtitle: Text(_personas[index].phone),
                leading: CircleAvatar(
                    child: Text(_personas[index].name.substring(0, 1))),
                trailing: Icon(Icons.arrow_forward_ios),
              );
            }),
      ),
    );
  }

  _borrarPersona(contexto, Persona persona) {
    showDialog(
        context: contexto,
        builder: (_) => AlertDialog(
              title: Text("Eliminar contacto"),
              content: Text("Estas seguro de eliminar" + ' ' + persona.name),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(contexto);
                    },
                    child: Text("Cancelar")),
                FlatButton(
                    onPressed: () {
                      print(persona.name);
                      this.setState(() {
                        this._personas.remove(persona);
                      });

                      Navigator.pop(contexto);
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ));
  }
}

class Persona {
  String name;
  String lastname;
  String phone;
  Persona(String name, String lastname, String phone) {
    this.name = name;
    this.lastname = lastname;
    this.phone = phone;
  }
}
