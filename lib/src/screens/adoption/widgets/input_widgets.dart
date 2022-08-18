import 'package:flutter/material.dart';

import '../adoption_model.dart';

class InputWidget extends StatefulWidget {
  final String? adoptID;
  final String? name;
  final String? age;
  final String? breed;
  final String? gender;

  const InputWidget(
      {Key? key, this.name, this.adoptID, this.age, this.breed, this.gender})
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final TextEditingController _tCon = TextEditingController();
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _ageCon = TextEditingController();
  final TextEditingController _breedCon = TextEditingController();
  final TextEditingController _genCon = TextEditingController();

  String? get current => widget.adoptID;
  String? get name => widget.name;
  String? get age => widget.age;
  String? get breed => widget.breed;
  String? get gender => widget.gender;

  @override
  void initState() {
    if (current != null) _tCon.text = current as String;
    if (name != null) _tCon.text = name as String;
    if (age != null) _tCon.text = age as String;
    if (breed != null) _tCon.text = breed as String;
    if (gender != null) _tCon.text = gender as String;

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        onChanged: () {
          _formKey.currentState?.validate();
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                current != null ? 'Adopt ID' : 'Adopt ID',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _tCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                name != null ? 'Name' : 'Name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                age != null ? 'Age' : 'Age',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _ageCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                gender != null ? 'Gender' : 'Gender',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _genCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                breed != null ? 'Breed' : 'Breed',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _breedCon,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.of(context).pop(Adoption(
                              adopteeID: _tCon.text,
                              name: _nameCon.text,
                              age: _ageCon.text,
                              breed: _breedCon.text,
                              gender: _genCon.text,

                          ));
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    primary: (_formKey.currentState?.validate() ?? false)
                        ? const Color(0xff3f51b5)
                        : Colors.grey),
                child: Text(current != null ? 'Edit' : 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
